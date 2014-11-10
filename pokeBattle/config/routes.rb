PokeBattle::Application.routes.draw do
  namespace :api, defaults: {format: 'json'}do

    resources :users do 
    	resources :pokedexes
    end

    resources :pokemons 

    get '/pokemon/map' => 'pokemons#map_pokemon'
  end
end
