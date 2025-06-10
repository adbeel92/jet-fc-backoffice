class AddAdminOnExpenses < ActiveRecord::Migration[8.0]
  def change
    add_reference :expenses, :admin, null: true, foreign_key: true
    add_column :admins, :name, :string, null: false, default: ""
    add_column :students, :last_name, :string, null: false, default: ""
    add_column :students, :nickname, :string, null: true
    add_column :coaches, :last_name, :string, null: false, default: ""
  end
end
