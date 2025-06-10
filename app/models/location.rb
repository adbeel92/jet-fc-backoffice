class Location < ApplicationRecord
  has_paper_trail

  has_many :sport_schedules
end
