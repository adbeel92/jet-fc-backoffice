class StudentPayment < ApplicationRecord
  has_paper_trail

  belongs_to :student

  enum :payment_type, {
    monthly: 0,
    weekly: 1,
    per_session: 2,
    uniform: 3
  }
  enum :payment_method, {
    cash: "cash",
    bank_transfer: "bank_transfer",
    credit_card: "credit_card",
    debit_card: "debit_card",
    deposit: "deposit"
  }

  scope :with_subscription_period, -> { where(payment_type: %i[monthly weekly]) }

  validates :amount, presence: true, numericality: { greater_than: 0 }

  rails_admin do
    edit do
      field :student
      field :amount
      field :payment_type
      field :paid_on
      field :payment_method, :enum do
        enum do
          klass = bindings[:object].class
          klass.payment_methods.keys.each_with_object({}) do |k, hash|
            hash[klass.t_enum(:payment_method, k)] = k
          end
        end
      end
      field :reference
    end

    list do
      field :student
      field :amount
      field :payment_type
      field :paid_on
      field :payment_method do
        pretty_value do
          bindings[:object].t_enum(:payment_method)
        end
      end
      field :reference
      field :created_at
      field :updated_at
    end

    show do
      field :student
      field :amount
      field :payment_type
      field :paid_on
      field :payment_method do
        pretty_value do
          bindings[:object].t_enum(:payment_method)
        end
      end
      field :reference
      field :created_at
    end
  end
end
