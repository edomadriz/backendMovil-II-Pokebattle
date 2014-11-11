class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.int :base_hp
      t.string :base_type
      t.int :height
      t.int :weight
      t.int :pokedex_id
      t.string :attack

      t.timestamps
    end
  end
end
