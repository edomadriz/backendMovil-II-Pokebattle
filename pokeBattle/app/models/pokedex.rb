class Pokedex < ActiveRecord::Base
	attr_accessible :user_id
	has_many :pokemon_pokedexes
	has_many :pokemons, through: :pokemon_pokedexes
end
