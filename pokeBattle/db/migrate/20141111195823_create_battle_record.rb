class CreateBattleRecord < ActiveRecord::Migration
	def change
		create_table :battle_records do |t|
			t.references :user
			t.integer :result
			t.integer :pokemon
			t.datetime :date
			t.integer :experience
			t.timestamps
		end
		add_index :battle_records, :user_id
	end
end
