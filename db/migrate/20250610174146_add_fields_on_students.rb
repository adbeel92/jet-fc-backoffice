class AddFieldsOnStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :phone, :string
    add_column :students, :tutor_name, :string
    add_column :students, :emergency_contact_name, :string
    add_column :students, :emergency_contact_phone, :string
    add_column :students, :address, :string
    change_column :students, :birthdate, :date
    add_column :students, :observations, :text
  end
end
