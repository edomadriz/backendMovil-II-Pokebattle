class Pokemon < ActiveRecord::Base
	attr_accessible :name, :base_hp, :base_type, :height, :weight, :pokedex_number, :attack
	has_many :pokemon_pokedexes
	has_many :pokedexs, through: :pokemon_pokedexes
end
