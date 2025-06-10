class CreateCoachPayments < ActiveRecord::Migration[8.0]
  def change
    create_table :coach_payments do |t|
      t.references :coach, null: false, foreign_key: true
      t.decimal :amount
      t.date :paid_on
      t.integer :concept
      t.text :notes

      t.timestamps
    end
  end
end
