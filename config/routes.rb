Hackernotes::Application.routes.draw do

  root :to => 'home#homepage'
  get 'search', :to => 'repositories#search'

  match '/auth/github/callback' => 'sessions#create', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match 'auth/failure', to: redirect('/')

  post '/create_note' => 'repositories#create_note'
  put '/vote' => 'votes#vote'
  delete '/remove' => 'remove#remove'

  get  ':owner/*name/*resource/*id', :to => 'notes#resource_iframe', :as => 'resource_iframe', :format => false
  get  ':owner/*name/*resource', :to => 'repositories#show_resources', :as => 'show_resources', :format => false
  get  ':owner/*name', :to => 'repositories#show', :as => 'show_repo', :format => false
#  get  ':username', :to => 'users#show', :as => 'user_profile', :format => false
end
