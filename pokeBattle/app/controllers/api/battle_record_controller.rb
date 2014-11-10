class Api::BattleRecordController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	def index
		@battle = get_battle_record
		respond_with @battle
	end

	def show
		if params[:email].present?
			@battles = find_battle_record_email(params[:email])
		else
			@battles = find_battle_record_twitter(params[:id_twitter])
		end
		respond_with @battles
	end

	def create
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

end
