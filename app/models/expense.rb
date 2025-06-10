class Expense < ApplicationRecord
  has_paper_trail

   validates :amount, presence: true, numericality: { greater_than: 0 }
end
