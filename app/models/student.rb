class Student < ApplicationRecord
  has_paper_trail

  has_many :enrollments
  has_many :student_payments
  has_many :attendance_records, as: :attendee

  scope :with_includes, -> {
    includes(:enrollments, :student_payments)
  }

  rails_admin do
    list do
      scopes [ :with_includes ]
      field :id
      field :name
      field :birthdate
      # field :amount_due do
      #   label "Monto adeudado"
      #   pretty_value { "$#{'%.2f' % value}" }
      #   sortable false
      #   visible do
      #     bindings[:controller].params[:scope] == "with_debt"
      # includes [ :enrollments ] # Removed as it is not valid in RailsAdmin
      # end
      field :debt_status_label do
        label "Estado de pago"
        pretty_value do
          value = bindings[:object].debt_status_label
          path = "/admin/student/#{bindings[:object].id}/debt_detail"
          "<a href='#{path}' style='text-decoration: none;' title='Ver detalle de deuda'>#{value}</a>".html_safe
        end
      end
      field :created_at
      field :updated_at
    end

    edit do
      field :first_name
      field :last_name
      field :nickname
      field :birthdate
      field :phone
      field :emergency_contact_name
      field :emergency_contact_phone
      field :address
      field :observations
    end
  end

  def amount_due
    self[:amount_due_total] || 0
  end

  def name
    "#{first_name} #{last_name} - #{nickname}".strip
  end

  def debt_status_color
    calculator = StudentDebtCalculator.new(self)
    periods = calculator.period_statuses
    has_active_enrollments = enrollments.any? { |e| e.status == "active" } ? :yes : :no

    if periods.all? { |p| p.status.include?("Pagado") }
      [ :green, has_active_enrollments ]
    elsif periods.any? { |p| p.status.include?("Pendiente") }
      [ :red, has_active_enrollments ]
    else
      [ :yellow, has_active_enrollments ]
    end
  end

  def debt_status_label
    colors = debt_status_color
    has_active_enrollments = colors[1] == :yes ? "" : "-sin inscripciones activas-"
    case colors[0]
    when :green
      has_active_enrollments.empty? ? "✅ Al día" : has_active_enrollments
    when :yellow
      "🟡 Pago parcial #{has_active_enrollments}"
    when :red
      "🔴 Con deuda #{has_active_enrollments}"
    end
  end
end
