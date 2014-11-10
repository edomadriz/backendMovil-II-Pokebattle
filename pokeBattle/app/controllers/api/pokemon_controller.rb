class Api::PokemonController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	
	def index
		@pokemons = get_pokemons
		respond_with @pokemons
	end

	def show
		@pokemon = find_pokemon(params[:pokedex_id])
		respond_with @pokemon
	end

	def create
		@pokemon = find_pokemon[:pokedex_id]
		if @pokemon.nil?
			@pokemon = Pokemon.new({:name=>params[:name], :base_hp=>params[:base_hp], :base_type=>params[:base_type],
			:height=>params[:height], :weight=>params[:weight], :pokedex_id=>params[:pokedex_id], :attack=>params[:attack]})
			@pokemon.save
			respond_with @pokemon do |format|
				format.json { render json: @pokemon.to_json}
			end
		end
	end


	private

	def get_pokemons
		Pokemon.all?
	end

	def find_pokemon(pokedex_id)
		Pokemon.where(pokedex_id: pokedex_id)
	end
end
