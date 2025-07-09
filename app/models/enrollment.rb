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

  validates :price_per_period, :status, presence: true, numericality: { greater_or_equal_than: 0 }

  rails_admin do
    list do
      field :id
      field :student
      field :sport
      field :enrollment_type
      field :status
      field :price_per_period
      field :start_date
      field :current_period_start_date
      field :current_period_end_date
      field :created_at
      field :updated_at
    end
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
end
