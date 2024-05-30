Rails.application.routes.draw do
  root 'posts#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
