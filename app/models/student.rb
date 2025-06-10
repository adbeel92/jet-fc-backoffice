class Student < ApplicationRecord
  has_paper_trail

  has_many :enrollments
  has_many :student_payments
  has_many :attendance_records, as: :attendee

  rails_admin do
    edit do
      field :name
      field :birthdate
    end
  end
end
