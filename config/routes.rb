Rails.application.routes.draw do
  resources :comment_likes
  get 'current_user/index'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  resources :posts
  resources :favorites
  resources :likes
  resources :comments
  resources :comment_replies

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
