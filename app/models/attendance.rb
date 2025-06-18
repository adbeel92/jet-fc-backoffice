class Attendance < ApplicationRecord
  has_paper_trail

  belongs_to :sport_schedule
  has_many :attendance_records, dependent: :destroy

  rails_admin do
    list do
      field :id
      field :sport_schedule
      field :attended_on
      field :created_at
      field :updated_at
    end

    edit do
      field :sport_schedule
      field :attended_on

      field :attendee_selection_ids, :serialized do
        visible do
          bindings[:object].sport_schedule.present?
        end
        label "Asistentes"
        help "Selecciona alumnos y profesores que asistieron"
        partial "form_attendees_multiselect" # lo vamos a crear
      end
    end
  end

  attr_accessor :attendee_selection_ids

  before_save :assign_attendees_from_selection

  def attendee_selection_ids
    @attendee_selection_ids ||= attendance_records.map { |r| "#{r.attendee_type}-#{r.attendee_id}" }
  end

  def assign_attendees_from_selection
    return if attendee_selection_ids.blank?

    self.attendance_records.destroy_all

    attendee_selection_ids.reject(&:blank?).each do |entry|
      type, id = entry.split("-")
      attendance_records.build(attendee_type: type, attendee_id: id)
    end
  end
end
