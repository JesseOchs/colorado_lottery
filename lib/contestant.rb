class Contestant
  attr_reader :game_interests
  def initialize(info)
    @info = info
    @game_interests = []
  end

  def full_name
    @info[:first_name] + " " + @info [:last_name]
  end

  def age
    @info[:age]
  end

  def state_of_residence
    @info[:state_of_residence]
  end

  def spending_money
    @info[:spending_money]
  end

  def out_of_state?
    state_of_residence != 'CO'
  end

  def add_game_interest(game)
    @game_interests << game
  end
end
