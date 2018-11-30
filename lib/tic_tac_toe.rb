class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end   
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 4, 8], # Top-Bottom diagonal
    [6, 4, 2], # Bottom-Top diagonal
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
    return index
  end   

  def move(index, current_player)
    @board[index] = current_player
  end   

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    
    elsif @board[index] == "X" || @board[index] == "O"
      true
    else puts "please enter 1-9:"
    end  
  end   

  def valid_move?(index)
    if index <= 8 && index >= 0 && !position_taken?(index)
      true
    else puts "Please enter 1-9:"
    end  
  end

  def turn
    puts "Please enter 1-9:"
  
    user_input = gets.strip
    index = input_to_index(user_input)
  
    if valid_move?(index) && !position_taken?(index)
      move(index, current_player)
      display_board
    else valid_move?(index) && !position_taken?(index)
      turn
    end  
  end

  def turn_count
    counter = 0
    @board.each do |turn|
    if turn == "O" || turn == "X"
      counter += 1
    end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
     return "X"
    elsif turn_count % 2 == 1
      return "O"
    end  
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] && 
      position_taken?(combo[0])
    end  
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    won? || full?
    if winning_combo = won?
      @board[winning_combo.first]
    end  
  end

  def play
    until over?
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end