class Api::PokedexesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	def index
		@user = get_user(params[:user_id])
		@pokedex = get_pokedex(@user)
		@pokemons = @pokedex.pokemons

		respond_with @pokemons 
	end

	private

	def get_user(user_id)
		User.find(user_id)
	end

	def get_pokedex(user)
		user.pokedex
	end
end
