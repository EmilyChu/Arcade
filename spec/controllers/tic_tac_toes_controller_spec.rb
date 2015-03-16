require 'rails_helper'

describe TicTacToesController do
  render_views

  it "can display the saved game page" do
    u1 = FactoryGirl.create :user
    u2 = FactoryGirl.create :user
    g = TicTacToe.start_game
    g.update!(player_x: u1.id, player_o: u2.id)

    get :show, id: g.id

    expect(response.code.to_i).to eq 200
  end

  fit "can lookup games from the database" do
    u1 = FactoryGirl.create :user
    u2 = FactoryGirl.create :user

    created = TicTacToe.new_game u1.id, u2.id
    loaded  = TicTacToe.saved_game created.id
    expect(created.id).to eq loaded.id
binding.pry
    expect(loaded.player_turn? 1).to eq true
  end

  it "can record a move" do
    g = TicTacToe.new_game 4,7
    g.record_move 3
    expect(g.value_at 3).to eq :x
  end

  it "knows whos turn it is" do
    g = TicTacToe.new_game 4,7
    g.record_move 3
    g.record_move 5
    g.record_move 1
    expect(g.player_turn? 7).to eq true
  end

end

