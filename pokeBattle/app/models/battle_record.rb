class BattleRecord < ActiveRecord::Base
	attr_accessible :result, :pokemon, :date, :experience, :user_id
end
