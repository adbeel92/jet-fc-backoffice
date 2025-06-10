class Attendance < ApplicationRecord
  has_paper_trail

  belongs_to :sport_schedule
  has_many :attendance_records, dependent: :destroy
end
