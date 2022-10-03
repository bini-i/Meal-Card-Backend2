Rails.application.routes.draw do
  # resources :employees
  # resources :departments
  devise_for :users
  # resources :employees
  # resources :departments

  resource :login, only: [:create], controller: :sessions

  namespace :v1 do
    get 'employees/:id', to: 'employees#serve'
    get 'employees', to: 'employees#finance'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
