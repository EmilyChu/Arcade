class TicTacToe < ActiveRecord::Base

  serialize :board, JSON
  serialize :players, JSON

  def self.start_game
    t = TicTacToe.new
    t.board = %w(-)*9
    t.save!
    return t
  end

  # def board
  #   JSON.parse self[:board]
  # end

  def mark sym, location
    self.board[location - 1] = sym
    save!
    # b[location - 1] = sym
    # self.update board: b.to_json
  end

  def value_at location
    self.board[location - 1]
  end
  
  def not_full?
    # board.none? { |n| n.nil? }  #returns true if block doesn't return true for all elements
    self.board.include? "-"
  end

  def winner
    lines = [ [1,2,3],[4,5,6],[7,8,9],
    [1,4,7],[2,5,8],[3,6,9],
    [1,5,9],[3,5,7]]
    lines.each do |line|
      winner = check_line_for_winner line
      return winner if ["x","o"].include?(winner)
    end
    return nil
  end

  def check_line_for_winner line
    values = line.map { |location| value_at location }
    if values.uniq.count == 1
      return values.first
    end
  end

#-----CONTROLLER STUFF-----------

  def self.new_game p1, p2
    t = start_game
    t.players = [p1, p2]
    t.current_player = 0
    t.save!
    t
  end

  def self.saved_game id
    TicTacToe.find(id)
  end

  def player_turn? p
    p == players[current_player]
  end

  def current_symbol
    current_player.zero? ? :x : :o
  end

  def toggle_player
    if current_player.zero?
      update current_player: 1
    else
      update current_player: 0
    end
  end

  def record_move location
    mark current_symbol, location
    toggle_player
    save!
  end

  def board_rows
    self.board.in_groups_of 3
  end

end
