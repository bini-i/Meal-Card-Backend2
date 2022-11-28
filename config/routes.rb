Rails.application.routes.draw do
  devise_for :users
  # resources :employees
  # resources :departments

  resource :login, only: [:create], controller: :sessions

  namespace :v1 do
    post 'employees/:id', to: 'employees#serve'
    post 'employees/check/:id', to: 'employees#check_employee'
    get 'employees', to: 'employees#finance'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "v1/employees#finance"
end
