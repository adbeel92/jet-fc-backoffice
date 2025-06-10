class Student < ApplicationRecord
  has_paper_trail

  has_many :enrollments
  has_many :student_payments
  has_many :attendance_records, as: :attendee

  rails_admin do
    edit do
      field :name
      field :birthdate
      field :phone
      field :emergency_contact_name
      field :emergency_contact_phone
      field :address
      field :observations
    end
  end
end
