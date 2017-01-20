Rails.application.routes.draw do
  
  resources :donations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :donors 
  resources :key_donors
    

  get '/donors/:id/donation', to: 'donors#donation'


  resources :parents 
  resources :students
  

  get 'add_student' => 'parents#add_student'

  

  devise_for :users, controllers: {registrations: 'registrations',:omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
