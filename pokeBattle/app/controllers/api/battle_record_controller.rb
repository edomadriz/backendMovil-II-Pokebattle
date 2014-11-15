class Api::BattleRecordController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	def index
		@battle = get_battle_record
		respond_with @battle
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
		if params[:email].present?
			@user = find_user_email(params[:email])
			@pokedex = PokemonPokedex.create({:pokedex_id=>@user.pokedex.id, :pokemon_id=>params[:pokemon]})
			@pokedex.save
			@user.experience = params[:experience]
			@user.save
			@battle = BattleRecord.create({:user_id=>@user.id, :result=>params[:result], :pokemon=>params[:pokemon],
				:date=>Time.now, :experience=>params[:experience]})
			@battle.save	 
		else
			@user = find_user_twitter(params[:id_twitter])
			@pokedex = PokemonPokedex.create({:pokedex_id=>@user.pokedex.id, :pokemon_id=>params[:pokemon]})
			@pokedex.save
			@user.experience = params[:experience]
			@user.save
			@battle = BattleRecord.create({:user_id=>@user.id, :result=>params[:result], :pokemon=>params[:pokemon],
				:date=>Time.now, :experience=>params[:experience]})
			@battle.save	
		end
	end

	private

	def get_battle_record
		BattleRecord.all
	end

	def find_battle_record_twitter(id_twitter)
		BattleRecord.where(id_twitter: id_twitter)
	end

	def find_battle_record_email(email)
		BattleRecord.where(email: email)
	end

	def find_user_email(email)
		User.where(email: email)
	end

	def find_user_twitter(id_twitter)
		User.where(id_twitter: id_twitter)
	end

end
