Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

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
