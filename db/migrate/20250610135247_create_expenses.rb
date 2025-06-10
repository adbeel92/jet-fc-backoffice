class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.string :concept
      t.decimal :amount
      t.date :paid_on
      t.text :notes

      t.timestamps
    end
  end
end
