class PokemonPokedex < ActiveRecord::Base
	attr_accessible :pokedex_id, :pokemon_id
	belongs_to :pokedex
	belongs_to :pokemon
end
