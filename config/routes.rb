Hackernotes::Application.routes.draw do

  root :to => 'home#homepage'
  get 'search', :to => 'repositories#search'

  match '/auth/github/callback' => 'sessions#create', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match 'auth/failure', to: redirect('/')

  post '/create_note' => 'repositories#create_note'

  get ':owner/:name', :to => 'repositories#show_repo', :as => 'show_repo'
end
