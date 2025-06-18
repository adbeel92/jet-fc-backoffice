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

  validates :price_per_period, presence: true, numericality: { greater_or_equal_than: 0 }

  rails_admin do
    list do
      field :id
      field :student
      field :sport
      field :enrollment_type
      field :price_per_period
      field :start_date
      field :end_date
      field :created_at
      field :updated_at
    end
  end
end
