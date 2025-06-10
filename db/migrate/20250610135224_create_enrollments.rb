class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :sport_schedule, null: false, foreign_key: true
      t.string :enrollment_type
      t.decimal :price_per_period
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
