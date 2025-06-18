class Sport < ApplicationRecord
  has_paper_trail

  has_many :sport_schedules

  rails_admin do
    list do
      field :id
      field :name
      field :created_at
      field :updated_at
    end

    edit do
      field :name
    end
  end
end
