class AddNewPlayerColumns < ActiveRecord::Migration
  def change
    add_column :tic_tac_toes, :players, :text
    add_column :tic_tac_toes, :current_player, :integer
  end
end
