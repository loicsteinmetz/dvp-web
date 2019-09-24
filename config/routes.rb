Rails.application.routes.draw do
  root to: 'static#home'
  get 'home', to: 'static#home'
  # get '/portfolio', to: 'static#portfolio'
  get '/mentions_legales', to: 'static#mentions_legales'
  post '/mail', to: 'mailer#contact_email'
  namespace :admin do
    root to: 'admin#dashboard'
    devise_for :admins
    resources :contents, only: [:update, :edit]
    resources :folios, except: [:index]
    put '/folios/:id/order_up', to: 'folios#order_up', as: 'folios_order_up'
    put '/folios/:id/order_down', to: 'folios#order_down', as: 'folios_order_down'
    resources :cv_entries, except: [:index]
    resources :time_cvs, except: [:index]
    put '/cv_time/:id/order_up', to: 'time_cvs#order_up', as: 'time_cv_order_up'
    put '/cv_time/:id/order_down', to: 'time_cvs#order_down', as: 'time_cv_order_down'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
