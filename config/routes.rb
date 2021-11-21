Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  get 'posts/:id/state', to: 'posts#state', as:'post_state'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
