Rails.application.routes.draw do

  resources :bookmarks

  root 'static_pages#home'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'bookmarks' => 'bookmarks#index'

	resources :users, only: [:new, :create], path_names: {new: 'sign_up'}
	resources :sessions
	resources :bookmarks


end
