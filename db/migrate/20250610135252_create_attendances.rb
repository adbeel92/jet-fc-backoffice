class CreateAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.references :sport_schedule, null: false, foreign_key: true
      t.date :attended_on

      t.timestamps
    end
  end
end
