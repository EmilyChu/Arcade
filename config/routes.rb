Rails.application.routes.draw do
  devise_for :users

  root 'application#home'

  resources :tic_tac_toes, only: [:new, :create, :show, :update]

  #get '/tictactoe/:game_id ' => 'tic_tac_toes#show'
  # post '/tictactoe/:game_id' => 'tic_tac_toes#create'
  # post '/tictactoe/:game_id/move ' => 'tic_tac_toes#move'
  
end
