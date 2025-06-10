class AddFieldsOnCoaches < ActiveRecord::Migration[8.0]
  def change
    add_column :coaches, :phone, :string
    add_column :coaches, :emergency_contact_name, :string
    add_column :coaches, :emergency_contact_phone, :string
    add_column :coaches, :address, :string
    change_column :coaches, :birthdate, :date
    add_column :coaches, :observations, :text
  end
end
