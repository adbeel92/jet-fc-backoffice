# app/services/student_debt_calculator.rb
class StudentDebtCalculator
  Period = Struct.new(:start_date, :end_date, :amount, :status)

  def initialize(student)
    @student = student
    @enrollments = student.enrollments.select { |e| e.start_date.present? && e.price_per_period.to_f > 0 }
    @payments = student.student_payments.sort_by(&:paid_on)
  end

  def period_statuses
    periods = enrollment_periods
    remaining_balance = @payments.sum(&:amount).to_f

    periods.map do |period|
      if remaining_balance >= period[:amount]
        remaining_balance -= period[:amount]
        Period.new(period[:start_date], period[:end_date], period[:amount], "Pagado")
      elsif remaining_balance > 0
        partial = remaining_balance
        remaining_balance = 0
        Period.new(period[:start_date], period[:end_date], period[:amount], "Parcial: #{partial}")
      else
        Period.new(period[:start_date], period[:end_date], period[:amount], "Pendiente")
      end
    end
  end

  private

  def enrollment_periods
    periods = []

    @enrollments.each do |enrollment|
      current = enrollment.start_date
      today = Date.today

      while current < today
        end_date =
          if enrollment.enrollment_type == "monthly"
            current.next_month - 1
          else
            current + 6
          end

        periods << {
          start_date: current,
          end_date: end_date,
          amount: enrollment.price_per_period.to_f
        }

        current =
          if enrollment.enrollment_type == "monthly"
            current.next_month
          else
            current + 7
          end
      end
    end

    periods.sort_by { |p| p[:start_date] }
  end
end
