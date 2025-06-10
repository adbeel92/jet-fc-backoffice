class AttendanceRecord < ApplicationRecord
  has_paper_trail

  belongs_to :attendance
  belongs_to :attendee, polymorphic: true
end
