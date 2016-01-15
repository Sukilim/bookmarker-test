Rails.application.routes.draw do

	resources :bookmarks

	get '/signup', to: "registrations#new", as: 'new_signup'
  post '/signup', to: "registrations#create", as: 'signup'

  get '/sign_in', to: "sessions#new", as: 'new_session'
  post '/sign_in', to: "sessions#create", as: 'sign_in'
  delete '/logout', to: "sessions#destroy", as: 'logout'

end
