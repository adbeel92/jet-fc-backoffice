class StudentPayment < ApplicationRecord
  has_paper_trail

  belongs_to :student

  enum :payment_type, {
    monthly: 0,
    weekly: 1,
    per_session: 2
  }

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
