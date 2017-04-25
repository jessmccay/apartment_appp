Rails.application.routes.draw do

  get 'admin/index'

  get 'admin/update'

  devise_for :users, :controller => { sessions: 'users/sessions',:omniauth_callbacks => "users/omnniauth_callbacks" }

  resources :apartments

  root 'apartments#index'

  get "admin" => "admin#index"

  put "admin/:id" => "admin#update"

  patch "admin/:id" => "admin#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
