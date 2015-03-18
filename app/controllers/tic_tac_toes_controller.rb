class TicTacToesController <ApplicationController
  before_action :authenticate_user!
  
  def show #display board
    @game = TicTacToe.saved_game params[:id]
    @can_play = @game.winner.nil? && @game.player_turn?(current_user.id)
    # binding.pry
  end

 def update #respond to a move
    game = TicTacToe.saved_game params[:id]
    if game.player_turn? current_user.id
      game.record_move params[:move].to_i
    else
      flash[:danger] = "it's not your turn"
    end
    redirect_to game
  end

  def create
    game = TicTacToe.new_game current_user.id, params[:opponent_id]
    redirect_to game
  end

  def new #pick opponent
  end

end