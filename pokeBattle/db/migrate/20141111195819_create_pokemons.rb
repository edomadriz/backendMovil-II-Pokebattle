class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :base_hp
      t.string :base_type
      t.integer :height
      t.integer :weight
      t.integer :pokedex_number
      t.string :attack

      t.timestamps
    end
  end
end
