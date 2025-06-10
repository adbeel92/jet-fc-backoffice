class Student < ApplicationRecord
  has_paper_trail

  has_many :enrollments
  has_many :student_payments
  has_many :attendance_records, as: :attendee
end
