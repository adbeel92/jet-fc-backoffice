class AttendanceRecord < ApplicationRecord
  belongs_to :attendance
  belongs_to :attendee, polymorphic: true
end
