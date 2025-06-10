class CreateStudentPayments < ActiveRecord::Migration[8.0]
  def change
    create_table :student_payments do |t|
      t.references :student, null: false, foreign_key: true
      t.decimal :amount
      t.integer :payment_type
      t.date :paid_on
      t.string :reference

      t.timestamps
    end
  end
end
