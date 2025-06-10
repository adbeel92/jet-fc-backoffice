class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :sport_schedule
end
