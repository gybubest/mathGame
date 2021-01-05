class Game
  def initialize
    @randomNum1 = rand(1..20)
    @randomNum2 = rand(1..20)
    @question = "What does #{@randomNum1} plus #{@randomNum2} equal?"
    @answer = @randomNum1 + @randomNum2
  end

  def validate(p1, p2, input)
    if input == @answer.to_s
      puts "Yes! You are correct."
      puts "P1: #{p1.life}/3 vs P2: #{p2.life}/3"

    else 
      puts "Seriously? No!"
      if p1.currentPlayer
        p1.life -= 1
      else
        p2.life -= 1
      end
      puts "P1: #{p1.life}/3 vs P2: #{p2.life}/3"
    end
  end

  def switchPlayers(p1, p2, isCurrentPlayer)
    if isCurrentPlayer
      p1.currentPlayer = false
      p2.currentPlayer = true
    else
      p2.currentPlayer = false
      p1.currentPlayer = true
    end
  end

  attr_accessor :question, :answer, :currentPlayer, :randomNum1, :randomNum2
end