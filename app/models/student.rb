class Student < ApplicationRecord
  has_paper_trail

  has_many :enrollments
  has_many :student_payments
  has_many :attendance_records, as: :attendee

  rails_admin do
    list do
      scopes [ :all, :with_debt ]

      field :id
      field :name
      field :birthdate
      field :amount_due do
        label "Monto adeudado"
        pretty_value { "$#{'%.2f' % value}" }
        sortable false
        visible do
          bindings[:controller].params[:scope] == "with_debt"
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

  scope :with_debt, lambda {
    joins(:enrollments)
      .joins(<<~SQL)
        LEFT JOIN student_payments sp
          ON sp.student_id = students.id
          AND sp.paid_on BETWEEN enrollments.start_date AND enrollments.end_date
      SQL
      .where("enrollments.price_per_period > 0 AND enrollments.enrollment_type != 2") # exclude per_session enrollments
      .group("students.id")
      .select(<<~SQL.squish)
        students.*,
        (SUM(enrollments.price_per_period) - SUM(COALESCE(sp.amount, 0))) AS amount_due_total
      SQL
      .having("(SUM(enrollments.price_per_period) - SUM(COALESCE(sp.amount, 0))) > 0")
  }

  def amount_due
    self[:amount_due_total] || 0
  end

  def name
    "#{first_name} #{last_name} - #{nickname}".strip
  end
end
