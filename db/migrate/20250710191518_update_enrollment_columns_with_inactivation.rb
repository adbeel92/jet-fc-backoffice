class UpdateEnrollmentColumnsWithInactivation < ActiveRecord::Migration[8.0]
  def change
    add_column :enrollments, :inactived_at, :datetime, null: true
    add_column :enrollments, :cancelled_at, :datetime, null: true
  end
end
