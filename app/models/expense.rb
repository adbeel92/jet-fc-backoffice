class Expense < ApplicationRecord
  has_paper_trail

  belongs_to :admin

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
