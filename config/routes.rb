Rails.application.routes.draw do
  devise_for :users
  
  resources :users do 
    resources :posts do 
      resources :favorites
      resources :likes
      resources :comments
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home_page#index'
end
