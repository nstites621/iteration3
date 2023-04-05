Rails.application.routes.draw do
  resources :meals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Defines root path
  root "meals#index"
  resources :projects

end
