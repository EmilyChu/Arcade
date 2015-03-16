class RemoveDefaultBoardFromTicTacToes < ActiveRecord::Migration
  def change
    change_column :tic_tac_toes, :board, :string, default: nil
  end
end
