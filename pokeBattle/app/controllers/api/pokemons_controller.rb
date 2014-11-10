class Api::PokemonsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	
	def index
		@pokemons = get_pokemons
		respond_with @pokemons
	end

	def show
		@pokemon = find_pokemon(params[:id])
		respond_with @pokemon
	end

	def create
		@pokemon = find_pokemon[:pokedex_number]
		if @pokemon.nil?
			@pokemon = Pokemon.new({:name=>params[:name], :base_hp=>params[:base_hp], :base_type=>params[:base_type],
			:height=>params[:height], :weight=>params[:weight], :pokedex_number=>params[:pokedex_number], :attack=>params[:attack]})
			@pokemon.save
			respond_with @pokemon do |format|
				format.json { render json: @pokemon.to_json}
			end
		end
	end

	def map_pokemon
		@map = (1..151).sort_by{rand}[0..19]
		respond_with @map
	end


	private

	def get_pokemons
		Pokemon.all
	end

	def find_pokemon(pokedex_number)
		Pokemon.where(pokedex_number: pokedex_number)
	end
end
