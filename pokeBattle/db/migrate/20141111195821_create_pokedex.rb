class CreatePokedex < ActiveRecord::Migration
	def change
		create_table :pokedexes do |t|
			t.references :user

			t.timestamps
		end

		add_index :pokedexes, :user_id
	end
end
