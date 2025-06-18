class UpdateNameToFirstNameOnStudents < ActiveRecord::Migration[8.0]
  def change
    rename_column :students, :name, :first_name
  end
end
