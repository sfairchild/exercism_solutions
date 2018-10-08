class Game
  attr_accessor :score

  def initialize
    @score = 0
    @rolls = []
  end

  def roll(pins)
    raise BowlingError if pins > 10 || pins < 0
    total_pins = if extra_frame?
                   pins
                 elsif double_strike?
                   pins * 3
                 elsif spare? || strike?
                   pins + pins
                 else
                   pins
                 end
    @rolls << pins
    @rolls << 0 if pins == 10
    @score += total_pins
  end

  def score
    raise BowlingError unless full_game?
    @score
  end

  def spare?
    @rolls.length >= 2 && @rolls[-1] + @rolls[-2] == 10 && @rolls.length <= 20
  end

  def strike?
    @rolls[-2] == 10 || @rolls[-4] == 10
  end
  
  def double_strike?
    @rolls[-2] == 10 && @rolls[-4] == 10
  end
  
  def extra_frame?
    @rolls.length >= 20
  end
  
  def full_game?
    length = @rolls.length
    (length == 20) ||
      (length == 21 && spare?) ||
      (length == 22 && strike?)
  end

  class BowlingError < Exception
  end
end
