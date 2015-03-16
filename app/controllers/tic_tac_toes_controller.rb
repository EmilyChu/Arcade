class TicTacToesController <ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  
  def show #display board
    @game = TicTacToe.saved_game params[:id]
    @can_play = if current_user
      @game.winner.nil? && @game.player_turn?(current_user.id) #don't have a current user cux i skipped authentication
    else
      false
    end
    head:ok
    # if current_user == @game.current_player
    #   render :play # view for player, has form for making next move, unless the game is over
    # else
    #   render :spectate # view for spectators, has no form
    # end
  end

 def update #respond to a move
    @game = TicTacToe.saved_game params[:id]
    if game.player_turn? current_user
      game.record_move params[:move]
    else
      flash[:danger] = "it's not your turn"
    end
    redirect_to game
  end

  def create
    game = TicTacToe.new_game current_user, params[:opponent_id]
    redirect_to tic_tac_toes_show_path(game)
  end

  def new #pick opponent
  end

end