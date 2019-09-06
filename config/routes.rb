Rails.application.routes.draw do
  root to: 'static#home'
  get '/portfolio', to: 'static#portfolio'
  post '/mail', to: 'static#contact_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
