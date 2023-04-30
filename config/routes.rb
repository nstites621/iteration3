Rails.application.routes.draw do
  
  devise_for :users
  root "meals#index"
  resources :meals
  #root "home#index
  
end
