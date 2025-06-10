class CreateAttendanceRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :attendance_records do |t|
      t.references :attendance, null: false, foreign_key: true
      t.references :attendee, polymorphic: true, null: false

      t.timestamps
    end
  end
end
