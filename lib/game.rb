class Game
  attr_reader :name, :cost
  def initialize(name, cost, national = false)
    @name = name
    @cost = cost
    @national_drawing = national
  end

  def national_drawing?
    @national_drawing
  end

end
