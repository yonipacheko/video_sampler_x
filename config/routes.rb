Myflix::Application.routes.draw do

  root to: 'videos#index'

  resources :videos do

  end

  post '/search', to: 'videos#search'

  resources :categories, only: [:new, :create, :show]



  get 'ui(/:action)', controller: 'ui'
end
