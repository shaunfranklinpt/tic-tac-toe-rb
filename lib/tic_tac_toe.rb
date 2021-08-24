WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
]

# board = [" ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
    user_input.to_i - 1
end


def move(board, position, player_token)
    board[position] = player_token
end


def position_taken?(board, position)
    if board[position] == " " || board[position] == "" || board[position] == nil
        false
    else board[position] == "X" || board[position] == "O"
        true
    end
end


def valid_move?(board, position)
    if position.between?(0, 8) && !position_taken?(board, position)
        true
    else
        false
    end
end


def turn_count(board)
    counter = 0
    board.each do |space|
        if space == "X" || space == "O"
            counter += 1
        end
    end
    counter
end


def current_player(board)
    # | ---- condition ---- |  ? (if true) : (if false)
    turn_count(board) % 2 == 0 ? "X" : "O"
end


def turn(board)
    puts "Please choose between 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    if valid_move?(board, position)
        move(board, position, current_player(board))
        display_board(board)
    else
        turn(board)
    end
end


# Two answers that I found online
# def won?(board)
#     WIN_COMBINATIONS.each do |win_combination|
#         win_index_1 = win_combination[0]
#         win_index_2 = win_combination[1]
#         win_index_3 = win_combination[2]

#         position_1 = board[win_index_1]
#         position_2 = board[win_index_2]
#         position_3 = board[win_index_3]

#         if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
#             return win_combination
#         end
#     end
#     return false
# end



def won?(board)
    WIN_COMBINATIONS.detect do |combo|
        board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
    end
end


# def full?(board)
#     board.all? {|i| i == "X" || i == "O"}
# end

def full?(board)
    turn_count(board) == 9
end


def draw?(board)
    !won?(board) && full?(board)
end

# def draw?(board)
#     if !won?(board) && full?(board)
#         true
#     elsif !won?(board) && !full?(board)
#         false
#     else won?(board)
#         false
#     end
# end


def over?(board)
    won?(board) || draw?(board) || full?(board)
end


def winner(board)
   if won?(board)
        return board[won?(board)[0]]
   end
end


def play(board)
    # puts "Please choose between 1-9:"
    # input = gets

    # counter = 0
    # until counter == 9
    #     turn(board)
    # counter += 1
    # end

    until over?(board)
        turn(board)
    end

    if won?(board)
        winner(board) == "X" || winner(board) == "O"
        puts "Congratulations #{winner(board)}!"
    else draw?(board)
        puts "Cat's Game!"
    end
end


# def play(board)

#     counter = 0
#     until counter == 9
#         turn(board)
#         counter += 1
#     end

#     until over?(board)
#         turn(board)
#     end

#     if won?(board)
#         puts "Congratulations #{winner(board)}!"
#     else draw?(board)
#         puts "Cat's Game!"
#     end
# end


# def play()
#     until over?(board)
#         turn(board)
#     end 

#     if won?(board)
#         puts "Congratulations #{winner(board)}!"
#     end
# end


























# -----------------------------------------------------------------------------------------------------------





# def position_taken?(board, position)
#     if board[position] == " " || board[position] == "" || board[position] == nil
#         false
#     else board[position] == "X" || board[position] == "O"
#         true
#     end
# end







# WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [2,4,6],
#     [0,4,8]
# ]


# def won?(board)
#     WIN_COMBINATION.detect do |combo|

#     [[0,1,2], [3,4,5], [6,7,8]].detect do |combo|

#     [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]].detect do |[6, 7, 8]|

#         board[6] == board[7] && board[7] == board[8] && THERE IS AN X OR O in spot board[6]
#                                                          position_taken?(board, combo[ ])

#         "X" == "X" && "X" == "X" && true  (<- this is because there is an X or O in spot board[6])
#     end
# end




# X, X, O
# O, O, ''
# X, X, X


# def won?("X", "X", "O", "O", "O", " ", "X", "X", "X")
#     [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]].detect do |[6,7,8]|

#         board[6] == board[7] && board[7] == board[8] && THERE IS AN X OR O in spot board[6]

#         "X" == "X" && "X" == "X" && true  (<- this is because there is an X or O in spot board[6])
#     end
# end





# def won?(board)
#     WIN_COMBINATION.detect do |combo|

#     [[0,1,2], [3,4,5], [6,7,8]].detect do |combo|

#     [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]].detect do |[0, 3, 6]|

#         board[0] == board[3] && board[3] == board[6] && THERE IS AN X OR O in spot board[6]
#                                                          position_taken?(board, combo[ ])

#         "X" == "X" && "X" == "X" && true  (<- this is because there is an X or O in spot board[6])
#     end
# end


















