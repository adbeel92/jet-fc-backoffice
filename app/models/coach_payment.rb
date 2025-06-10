class CoachPayment < ApplicationRecord
  has_paper_trail

  belongs_to :coach

  enum :concept, {
    per_month: 0,
    per_week: 1,
    per_session: 2
  }

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
