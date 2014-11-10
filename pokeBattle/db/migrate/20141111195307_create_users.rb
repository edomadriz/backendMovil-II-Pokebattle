class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :experience
      t.integer :base_pokemon
      t.integer :id_twitter

      t.timestamps
    end
  end
end
