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

  validates :price_per_period, presence: true, numericality: { greater_than: 0 }
end
