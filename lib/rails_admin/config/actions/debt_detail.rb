module RailsAdmin
  module Config
    module Actions
      class DebtDetail < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :only do
          [ "Student" ]
        end

        register_instance_option :member do
          true
        end

        register_instance_option :object? do
          false
        end

        register_instance_option :visible? do
          authorized? && bindings[:object].is_a?(Student)
        end

        register_instance_option :http_methods do
          [ :get ]
        end

        register_instance_option :controller do
          proc do
            @student = Student.find(params[:id])
            @periods = StudentDebtCalculator.new(@student).period_statuses
            render template: "rails_admin/custom/debt_detail"
          end
        end

        register_instance_option :link_icon do
          "fa fa-money-bill"
        end
      end
    end
  end
end
