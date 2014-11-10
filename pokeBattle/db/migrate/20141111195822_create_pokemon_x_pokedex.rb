class CreatePokemonXPokedex < ActiveRecord::Migration
  def change
		create_table :pokemon_pokedexes do |t|
			t.references :pokedex
			t.references :pokemon

			t.timestamps
		end

		add_index :pokemon_pokedexes, :pokedex_id
		add_index :pokemon_pokedexes, :pokemon_id
	end
end
