class StudentPayment < ApplicationRecord
  has_paper_trail

  belongs_to :student

  enum :payment_type, {
    monthly: "monthly",
    weekly: "weekly",
    per_session: "per_session"
  }

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
