class Question
  def initialize
    @randomNum1 = rand(1..20)
    @randomNum2 = rand(1..20)
    @question = "What does #{@randomNum1} plus #{@randomNum2} equal?"
    @answer = @randomNum1 + @randomNum2
  end

  def validate(input)
    if input == @answer.to_s
      true
    else 
      false
    end
  end

  attr_accessor :question, :answer
end