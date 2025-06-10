class CreateJoinTableCoachSportSchedule < ActiveRecord::Migration[8.0]
  def change
    create_join_table :coaches, :sport_schedules do |t|
      t.index :coach_id
      t.index :sport_schedule_id
      t.index [ :coach_id, :sport_schedule_id ]
      t.index [ :sport_schedule_id, :coach_id ]
    end
  end
end
