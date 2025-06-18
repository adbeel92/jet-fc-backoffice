class SportSchedule < ApplicationRecord
  has_paper_trail

  belongs_to :sport
  belongs_to :location
  has_and_belongs_to_many :coaches
  has_and_belongs_to_many :enrollments
  has_many :attendances

  enum :day_of_week, {
    monday: 0,
    tuesday: 1,
    wednesday: 2,
    thursday: 3,
    friday: 4,
    saturday: 5,
    sunday: 6
  }

  rails_admin do
    list do
      field :id
      field :sport
      field :location
      field :day_of_week
      field :start_time do
        formatted_value do
          bindings[:object].start_time.strftime("%H:%M") if bindings[:object].start_time
        end
      end
      field :end_time do
        formatted_value do
          bindings[:object].end_time.strftime("%H:%M") if bindings[:object].end_time
        end
      end
    end
    edit do
      exclude_fields :enrollments, :attendances
    end
  end

  def name
    if persisted?
      "#{sport&.name} - #{day_of_week.capitalize} #{start_time.strftime('%H:%M')}"
    else
      "New Schedule"
    end
  end
end
