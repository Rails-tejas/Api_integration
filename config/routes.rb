Rails.application.routes.draw do
  root 'cats#index'
  get '/search', to: 'cats#search', as: 'search_cats'
end
