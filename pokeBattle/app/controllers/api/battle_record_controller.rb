class Api::BattleRecordController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	def index
		@battle = get_battle_record
		@battleHash = {:battle=>@battle}
		respond_with @battleHash
	end

	def show
		@battles = find_battle_record(params[:id])
		@battleHash = {:battlerecord=>@battles}
		respond_with @battleHash
	end

	def show_battle
		if params[:email].present?
			@battles = find_battle_record_email(params[:email])
		else
			@battles = find_battle_record_twitter(params[:id_twitter])
		end
		respond_with @battles
	end

	def create
		@user = find_user(params[:user_id])
		@pokedex = get_pokedex(@user.id) 
		@pokedex = PokemonPokedex.create({:pokedex_id=>@user.pokedex.id, :pokemon_id=>params[:pokemon]})
		@pokedex.save
		@user.experience = params[:experience]
		@user.save
		@battle = BattleRecord.create({:user_id=>@user.id, :result=>params[:result], :pokemon=>params[:pokemon],
			:date=>Time.now, :experience=>params[:experience]})
		@battle.save

		respond_with @battle do |format|
					format.json { render json: @user.to_json }
				end
	end


	#def create_with_params
	#	if params[:email].present?
	#		@user = find_user_email(params[:email])
	#		@pokedex = PokemonPokedex.create({:pokedex_id=>@user.pokedex.id, :pokemon_id=>params[:pokemon]})
	#		@pokedex.save
	#		@user.experience = params[:experience]
	#		@user.save
	#		@battle = BattleRecord.create({:user_id=>@user.id, :result=>params[:result], :pokemon=>params[:pokemon],
	#			:date=>Time.now, :experience=>params[:experience]})
	#		@battle.save	 
	#	else
	#		@user = find_user_twitter(params[:id_twitter])
	#		@pokedex = PokemonPokedex.create({:pokedex_id=>@user.pokedex.id, :pokemon_id=>params[:pokemon]})
	#		@pokedex.save
	#		@user.experience = params[:experience]
	#		@user.save
	#		@battle = BattleRecord.create({:user_id=>@user.id, :result=>params[:result], :pokemon=>params[:pokemon],
	#			:date=>Time.now, :experience=>params[:experience]})
	#		@battle.save	
	#	end
	#end

	private

	def find_user(id)
		User.find(id)
	end

	def get_battle_record
		BattleRecord.all
	end

	def find_battle_record(id)
		BattleRecord.where(user_id: id)
	end

	def get_pokedex(id)
		Pokedex.where(user_id: id).first
	end

end
