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

  def name
    "#{sport.name} - #{day_of_week.capitalize} #{start_time.strftime('%H:%M')}"
  end
end
