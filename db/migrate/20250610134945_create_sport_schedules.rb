class CreateSportSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :sport_schedules do |t|
      t.references :sport, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.integer :day_of_week
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
