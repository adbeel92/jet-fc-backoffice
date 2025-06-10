class Coach < ApplicationRecord
  has_paper_trail

  has_and_belongs_to_many :sport_schedules
  has_many :attendance_records, as: :attendee
  has_many :coach_payments

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
