Rails.application.routes.draw do
  
  devise_for :users
  root "meals#index"
  resources :meals

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end

end