# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

  WIN_COMBINATIONS = [
    [0, 1, 2],  #top row win
    [3, 4, 5],  #middle row win
    [6, 7, 8],  #bottom row win
    [0, 3, 6],  #left column win
    [1, 4, 7],  #middle column win
    [2, 5, 8],  #right column win
    [0, 4, 8], #top left to bottom right win
    [2, 4, 6], #bottom left to top right win
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && board[combo[0]] != " " && board[combo[0]] != "" && !board[combo[0]].nil?)
      return combo
      break
    end
  end
  return false
end

def full?(board)
  if !(won?(board))
    board.each do |e|
      if (e != "X" && e != "O")
        return false
      end
    end
  end
  return true
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    return board[winner[0]]
  else
    nil
  end
end
