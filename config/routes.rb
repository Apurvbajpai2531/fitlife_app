Rails.application.routes.draw do
  devise_for :users

  root "home#index"  # 👈 This is your new landing page

  resources :workouts
  resources :categories
  resources :plans
  resources :achievements

  # Add any other routes you need
end
