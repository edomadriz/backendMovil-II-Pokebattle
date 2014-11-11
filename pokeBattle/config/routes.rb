PokeBattle::Application.routes.draw do
  namespace :api, defaults: {format: 'json'}do

    resources :users

    resources :pokemons
  end
end
