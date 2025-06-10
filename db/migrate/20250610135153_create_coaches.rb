class CreateCoaches < ActiveRecord::Migration[8.0]
  def change
    create_table :coaches do |t|
      t.string :name
      t.datetime :birthdate

      t.timestamps
    end
  end
end
