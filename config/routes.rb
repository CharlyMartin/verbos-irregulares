Rails.application.routes.draw do

  devise_for :users

  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
    get '/method', to: 'pages#method', as: 'method'
    resources :temp_emails, only: [ :new, :create ]
  end

end
