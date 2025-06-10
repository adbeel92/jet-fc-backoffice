class Coach < ApplicationRecord
  has_paper_trail

  has_and_belongs_to_many :sport_schedules
  has_many :attendance_records, as: :attendee
  has_many :coach_payments
end
