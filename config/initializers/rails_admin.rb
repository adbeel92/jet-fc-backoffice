RailsAdmin.config do |config|
  config.main_app_name = "JET F\u00FAtbol Club"
  config.asset_source = :importmap

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, "Admin", "PaperTrail::Version"

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true


  config.model "Admin" do
    visible false
  end

  config.model "AttendanceRecord" do
    visible false

    edit do
      field :attendee_type, :enum do
        enum do
          [ "Student", "Coach" ]
        end
      end

      field :attendee_id, :integer do
        label "ID del asistente"
        help "Debes ingresar manualmente el ID del Coach o Student seg\u00FAn el tipo."
      end
    end
  end
end
