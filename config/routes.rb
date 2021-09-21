Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts
  root 'posts#index' 
  
  get 'home/index'
  get 'home/about'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
