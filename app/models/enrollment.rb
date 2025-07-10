class Enrollment < ApplicationRecord
  has_paper_trail

  belongs_to :student
  belongs_to :sport
  has_and_belongs_to_many :sport_schedules

  enum :enrollment_type, {
    monthly: 0,
    weekly: 1,
    per_session: 2
  }
  enum :status, {
    active: 0,
    inactive: 1,
    cancelled: 2
  }

  validates :status, presence: true
  validates :price_per_period, presence: true, numericality: { greater_or_equal_than: 0 }

  rails_admin do
    list do
      field :id
      field :student
      field :sport
      field :enrollment_type
      field :status_label do
        label "Estado"
        pretty_value do
          value = bindings[:object].status_label
          "<span>#{value}</span>".html_safe
        end
      end
      field :price_per_period
      field :start_date
      field :current_period_start_date
      field :current_period_end_date
      field :created_at
      field :updated_at
    end

    edit do
      field :student
      field :sport
      field :enrollment_type
      field :price_per_period
      field :start_date
      field :sport_schedules
    end
  end

  def cancel!
    self.cancelled_at = Time.current
    self.status = :cancelled
    save!
  end

  def current_period_start_date
    return if start_date.nil?

    now = Time.current
    @current_period_start_date ||= Date.new(now.year, now.month, start_date.day)
  end

  def current_period_end_date
    return nil if start_date.nil? || enrollment_type.nil?

    @current_period_end_date ||= case enrollment_type
    when "monthly"
      current_period_start_date.next_month - 1.day
    when "weekly"
      current_period_start_date + 6.days
    end
  end

  def status_label
    case status
    when "active"
      "🟢 Activo"
    when "inactive"
      "🟡 Inactivo"
    when "cancelled"
      "🔴 Cancelado"
    else
      "-"
    end
  end
end
