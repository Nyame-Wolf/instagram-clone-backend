Rails.application.routes.draw do
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
  resources :stories
  resources :comment_likes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
