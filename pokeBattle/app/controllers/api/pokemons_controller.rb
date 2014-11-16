class Api::PokemonsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	
	def index
		@pokemons = get_pokemons
		@pokeHash = {:pokemon=>@pokemons}
		respond_with @pokeHash
	end

	def show
		@pokemon = find_pokemon(params[:id])
		@pokeHash = {:pokemon=>pokemon}
		respond_with @pokeHash
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

		@mapHash = {:pokemons=>[{:pokemon1=>@map[0],:pokemon2=>@map[1],:pokemon3=>@map[2],:pokemon4=>@map[3],
			:pokemon5=>@map[4],:pokemon6=>@map[5],:pokemon7=>@map[6],:pokemon8=>@map[7],
			:pokemon9=>@map[8],:pokemon10=>@map[9],:pokemon11=>@map[10],:pokemon12=>@map[11],
			:pokemon13=>@map[12],:pokemon14=>@map[13],:pokemon15=>@map[14],:pokemon16=>@map[15],
			:pokemon17=>@map[16],:pokemon18=>@map[17],:pokemon19=>@map[18],:pokemon20=>@map[19]}]}
		respond_with @mapHash
	end


	private

	def get_pokemons
		Pokemon.all
	end

	def find_pokemon(pokedex_number)
		Pokemon.where(pokedex_number: pokedex_number).first
	end
end
