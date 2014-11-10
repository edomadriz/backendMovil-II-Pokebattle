class Api::BattleRecordController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	def index
		@battle = get_battle_record
		respond_with @battle
	end

	def create
	end

	private

	def get_battle_record
		BattleRecord.all
	end

end
