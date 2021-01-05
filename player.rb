class Player
  @@index = 0
  def initialize(current)
    @@index += 1
    @index = @@index
    @life = 3
    @currentPlayer = current
  end

  attr_accessor :index, :life, :currentPlayer
end