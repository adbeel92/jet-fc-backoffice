class AddPaymentMethodOnStudentPayments < ActiveRecord::Migration[8.0]
  def change
    add_column :student_payments, :payment_method, :string, null: false, default: 'cash'
  end
end
