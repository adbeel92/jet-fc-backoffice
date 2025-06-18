class Expense < ApplicationRecord
  has_paper_trail

  belongs_to :admin

  validates :amount, presence: true, numericality: { greater_than: 0 }

  rails_admin do
    list do
      field :id
      field :concept
      field :amount
      field :paid_on
      field :admin
      field :created_at
      field :updated_at
    end
  end
end
