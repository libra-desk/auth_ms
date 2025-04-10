Rails.application.routes.draw do
  post "/signup", to: "auth#signup"
  post "/login", to: "auth#login"

  get "up" => "rails/health#show", as: :rails_health_check
end
