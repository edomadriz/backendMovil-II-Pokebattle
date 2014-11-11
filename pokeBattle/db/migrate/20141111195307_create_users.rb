class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.int :experience
      t.int :base_pokemon

      t.timestamps
    end
  end
end
