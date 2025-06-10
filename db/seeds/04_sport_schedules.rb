data = [
  {
    sport: 'Fútbol Categoría libre',
    location: 'Deportivo Leona Vicario',
    schedules: [
      { day_of_week: :monday, start_time: '8:00am', end_time: '10:00am' },
      { day_of_week: :wednesday, start_time: '8:00am', end_time: '10:00am' },
      { day_of_week: :friday, start_time: '8:00am', end_time: '10:00am' }
    ]
  }
]

data.each do |sport_data|
  sport = Sport.find_by(name: sport_data[:sport])
  next unless sport&.sport_schedules&.empty?

  location = Location.find_by(name: sport_data[:location])
  next unless location&.sport_schedules&.empty?

  data = sport_data[:schedules].map do |schedule_data|
    {
      sport_id: sport.id,
      location_id: location.id,
      day_of_week: schedule_data[:day_of_week],
      start_time: Time.parse(schedule_data[:start_time]),
      end_time: Time.parse(schedule_data[:end_time])
    }
  end
  SportSchedule.create!(data)
end
