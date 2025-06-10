Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :admins
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
end
