class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game)
  end

  def register_contestant(contestant, game)
       hash(contestant, game)
        if contestant.game_interests.include?(game.name)
          @registered_contestants[game.name].push(contestant)
        end
  end

  def hash(contestant, game)
        @registered_contestants[game.name] = []
  end

  def eligible_contestants(game)
    eligible = []
  @registered_contestants.select { |key, value|
    if value.spending_money >= game.cost && value.game_interests.include?(game.name)
        eligible << value
      end
    }
    return eligible.uniq
  end

end
# def eligible_contestants(game)
#   @registered_contestants.select { |key, value| value.game_interests.include?(game.name)}.uniq.flatten
# end
