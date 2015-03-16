class CreateTicTacToes < ActiveRecord::Migration
  def change
    create_table :tic_tac_toes do |t|
      t.integer :player_x
      t.integer :player_o
      t.string  :board 
      t.boolean :wins

      t.timestamps null: false
    end
  end
end
