PokeBattle::Application.routes.draw do
  namespace :api, defaults: {format: 'json'}do

    resources :users, only: [:index, :create, :update] do 
    	resources :pokedexes, only: [:index]
    end

    resources :pokemons, only: [:index, :show, :create]

    resources :battle_record

    get '/pokemon/map' => 'pokemons#map_pokemon'

    get '/poke_master' => 'users#show_user'

    get '/battle' => 'battle_record#show_battle'
  end
end
