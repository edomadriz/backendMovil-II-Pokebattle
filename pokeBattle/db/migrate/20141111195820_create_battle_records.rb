class CreateBattleRecords < ActiveRecord::Migration
  def change
    create_table :battle_records do |t|
      t.string :email
      t.integer :status
      t.integer :pokemon
      t.string :date
      t.integer :experience

      t.timestamps
    end
  end
end
