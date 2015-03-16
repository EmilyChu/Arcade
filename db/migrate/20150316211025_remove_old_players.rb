class RemoveOldPlayers < ActiveRecord::Migration
  def change 
    remove_column :tic_tac_toes, :player_x, :integer
    remove_column :tic_tac_toes, :player_o, :integer
  end
end
