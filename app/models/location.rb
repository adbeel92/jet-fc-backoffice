class Location < ApplicationRecord
  has_paper_trail

  has_many :sport_schedules

  rails_admin do
    edit do
      field :name
    end
  end
end
