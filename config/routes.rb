Rails.application.routes.draw do
  root to: 'static#home'
  get 'home', to: 'static#home'
  # get '/portfolio', to: 'static#portfolio'
  get '/mentions_legales', to: 'static#mentions_legales'
  post '/mail', to: 'mailer#contact_email'
  namespace :admin do
    root to: 'admin#dashboard'
    devise_for :admins
    resources :contents, only: [:update]
    resources :folios, only: [:update]
    resources :cv_entries, only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
