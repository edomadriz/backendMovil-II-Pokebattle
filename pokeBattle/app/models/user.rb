class User < ActiveRecord::Base
	attr_accessible :name, :email, :experience, :base_pokemon, :id_twitter
	has_one :pokedex
end
