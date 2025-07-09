class UpdateEnrollmentColumns < ActiveRecord::Migration[8.0]
  def change
    remove_column :enrollments, :end_date, :date
    add_column :enrollments, :status, :integer, default: 0, null: false
  end
end
