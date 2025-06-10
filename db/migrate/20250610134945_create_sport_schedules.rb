class CreateSportSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :sport_schedules do |t|
      t.references :sport, null: false, foreign_key: true
      t.integer :day_of_week
      t.time :start_time
      t.time :end_time
      t.string :location

      t.timestamps
    end
  end
end
