Rails.application.routes.draw do
  namespace :api do
    resources :posts
    resources :ping
  end
end
