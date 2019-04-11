Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "topics#index"

  resources :topics do
    resources :comments # NHO: you have multiple routes going to the same controller actions, might want to limit the routes made here
  end

  resources :comments, only: [:new, :create, :destroy]

end
