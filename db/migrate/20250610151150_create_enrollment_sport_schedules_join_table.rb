class CreateEnrollmentSportSchedulesJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :enrollments, :sport_schedules do |t|
      t.index :enrollment_id
      t.index :sport_schedule_id
    end
  end
end
