class CoachPayment < ApplicationRecord
  has_paper_trail

  belongs_to :coach

  enum :concept, {
    per_week: "per_week",
    per_month: "per_month",
    per_session: "per_session"
  }

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
