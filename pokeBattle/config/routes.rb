PokeBattle::Application.routes.draw do
  namespace :api, defaults: {format: 'json'}do

    resources :users, only: [:index, :show, :create, :update] do 
    	resources :pokedexes, only: [:index]
    end

    resources :pokemons, only: [:index, :show, :create]

    resources :battle_record, only: [:index, :show, :create]

    get '/pokemon/map' => 'pokemons#map_pokemon'

    get '/poke_master' => 'users#show_user'

    get '/battle' => 'battle_record#show_battle'
  end
end
