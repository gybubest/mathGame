require './player'
require './question'

class Game
  def initialize
    @currentPlayer = 1
  end

  def switchPlayer
    if @currentPlayer == 1
      @currentPlayer = 2
    else
      @currentPlayer = 1
    end
  end

  def run
    @p1 = Player.new
    @p2 = Player.new

    while @p1.life >= 0 && @p2.life >= 0
      @newQuestion = Question.new
      puts "Player #{@currentPlayer}: #{@newQuestion.question}"
      print "> "
      input = $stdin.gets.chomp
      @result = @newQuestion.validate(input)

      if @result
        puts "Yes! You are correct."
        puts "P1: #{@p1.life}/3 vs P2: #{@p2.life}/3\n----- NEW TURN -----"
        switchPlayer
      else 
        if @currentPlayer == 1
          @p1.life -= 1
        else
          @p2.life -= 1
        end
        
        puts "Seriously? No!\nP1: #{@p1.life}/3 vs P2: #{@p2.life}/3"

        if @p1.life == 0
          puts "Player 2 wins with a score of #{@p2.life}/3\n----- GAME OVER -----\nGoodbye!"
          return
        elsif @p2.life == 0
          puts "Player 1 wins with a score of #{@p1.life}/3\n----- GAME OVER -----\nGoodbye!"
          return
        end

        puts "----- NEW TURN -----"
        switchPlayer
      end
    end
  end

  
end