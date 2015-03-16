require 'rails_helper'

describe TicTacToe do
  it "can initialize a board" do
    t = TicTacToe.start_game
    t.board

    expect(t.board).to eq ["-", "-", "-", "-", "-", "-", "-", "-", "-"]
  end

  it "can mark 'x' and 'o' on board" do
    t = TicTacToe.start_game
    t.mark "x", 5
    t.mark "o", 6

    expect(t.board).to eq ["-", "-", "-", "-", "x", "o", "-", "-", "-"]
  end

  it "can tell you the value at a location" do
    t = TicTacToe.start_game
    t.mark "x", 2
    
    expect(t.value_at 2).to eq "x"
    expect(t.value_at 1).to eq "-"
  end

  it "can tell you if the board is not full" do
    t = TicTacToe.start_game
    t.board = ["x", "o", "o", "o", "o", "x", "x", "x", "o"]
    expect(t.not_full?).to eq false

    t.board = ["-", "o", "o", "o", "o", "x", "x", "x", "o"]
    expect(t.not_full?).to eq true
  end

  it "can tell you if there is a winner" do
    t = TicTacToe.start_game
    t.board = ["x", "x", "x", "o", "o", "x", "x", "o", "o"] #horizontal
    expect(t.winner).to eq "x"

    t.board = ["o", "o", "x", "x", "x", "x", "o", "x", "o"]
    expect(t.winner).to eq "x"

    t.board = ["x", "o", "o", "o", "o", "x", "x", "x", "x"]
    expect(t.winner).to eq "x"    

    t.board = ["o", "o", "x", "x", "o", "o", "x", "x", "o"] #diagnol
    expect(t.winner).to eq "o"

    t.board = ["x", "x", "o", "x", "o", "o", "o", "x", "x"]
    expect(t.winner).to eq "o"

    t.board = ["x", "x", "o", "x", "o", "o", "x", "o", "x"] #vertical
    expect(t.winner).to eq "x"
  end

end
