module RailsAdmin
  module Config
    module Actions
      class CancelEnrollment < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :only do
          [ "Enrollment" ]
        end

        register_instance_option :member do
          true
        end

        register_instance_option :object? do
          false
        end

        register_instance_option :visible? do
          authorized? && bindings[:object].is_a?(Enrollment)
        end

        register_instance_option :http_methods do
          [ :put ]
        end

        register_instance_option :controller do
          proc do
            @enrollment = Enrollment.find(params[:id])
            if @enrollment.cancel!
              flash[:success] = "Inscripci\u00F3n cancelada exitosamente."
            else
              flash[:error] = "Error al cancelar la inscripci\u00F3n."
            end
            redirect_to back_or_index
          end
        end

        register_instance_option :link_icon do
          "fa fa-ban"
        end
      end
    end
  end
end
