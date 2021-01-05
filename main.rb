require './player'
require './game'

def start
  p1 = Player.new(true)
  p2 = Player.new(false)

  g1 = Game.new
  puts "Player 1: #{g1.question}"
  print "> "
  input = $stdin.gets.chomp
  g1.validate(p1, p2, input)

  while p1.life >= 0 && p2.life >= 0
    if p1.life == 0
      puts "Player 2 wins with a score of #{p2.life}/3\n----- GAME OVER -----\nGoodbye!"
      return
    elsif p2.life == 0
      puts "Player 1 wins with a score of #{p1.life}/3\n----- GAME OVER -----\nGoodbye!"
      return
    end

    puts "----- NEW TURN -----"
    game = Game.new
    game.switchPlayers(p1, p2, p1.currentPlayer)
    playerNumber = p1.currentPlayer ? p1.index : p2.index
    puts "Player #{playerNumber}: #{game.question}"
    print "> "
    input = $stdin.gets.chomp
    game.validate(p1, p2, input)
  end
end

start