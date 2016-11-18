Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
    get '/method', to: 'pages#method', as: 'method'
  end

end
