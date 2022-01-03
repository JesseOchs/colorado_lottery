require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"

RSpec.describe ColoradoLottery do
  let(:lottery) {ColoradoLottery.new}
  let(:pick_4) {Game.new('Pick 4', 2)}
  let(:mega_millions) {Game.new('Mega Millions', 5, true)}
  let(:cash_5) {Game.new('Cash 5', 1)}
  let(:alexander) {Contestant.new({
                     first_name: 'Alexander',
                     last_name: 'Aigades',
                     age: 28,
                     state_of_residence: 'CO',
                     spending_money: 10})}
  let(:benjamin) {Contestant.new({
                      first_name: 'Benjamin',
                      last_name: 'Franklin',
                      age: 17,
                      state_of_residence: 'PA',
                      spending_money: 100})}
  let(:frederick) {Contestant.new({
                      first_name:  'Frederick',
                      last_name: 'Douglas',
                      age: 55,
                      state_of_residence: 'NY',
                      spending_money: 20})}
  let(:winston)   {Contestant.new({
                      first_name: 'Winston',
                      last_name: 'Churchill',
                      age: 18,
                      state_of_residence: 'CO',
                      spending_money: 5})}
  let(:grace)     {Contestant.new({
                      first_name: 'Grace',
                      last_name: 'Hopper',
                      age: 20,
                      state_of_residence: 'CO',
                      spending_money: 20})}



  it 'exists' do
    expect(lottery).to be_a(ColoradoLottery)
  end

  it 'registered contestants' do
    expect(lottery.registered_contestants).to eq({})
  end

  it 'winners' do
    expect(lottery.winners).to eq([])
  end

  it 'current contestants' do
    expect(lottery.current_contestants).to eq({})
  end

  it 'age and interest' do
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    expect(lottery.interested_and_18?(alexander, pick_4)).to eq(true)
    expect(lottery.interested_and_18?(benjamin, mega_millions)).to eq(false)
    expect(lottery.interested_and_18?(alexander, cash_5)).to eq(false)
  end


  it 'registration' do
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    expect(lottery.can_register?(alexander, pick_4)).to eq(true)
    expect(lottery.can_register?(alexander, cash_5)).to eq(false)
    expect(lottery.can_register?(frederick, mega_millions)).to eq(true)
    expect(lottery.can_register?(benjamin, mega_millions)).to eq(false)
    expect(lottery.can_register?(frederick, cash_5)).to eq(false)
  end

  it 'registration' do
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    lottery.register_contestant(alexander, pick_4)
    expected = {
      pick_4.name => alexander
    }

    expect(lottery.registered_contestants).to eq(expected)

    lottery.register_contestant(alexander, mega_millions)
    expected = {
      pick_4.name => alexander,
      mega_millions.name => alexander
    }
    expect(lottery.registered_contestants).to eq(expected)
  end


  it 'registration' do
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    lottery.register_contestant(alexander, pick_4)
    lottery.register_contestant(alexander, mega_millions)
    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)
    expected = {
      pick_4.name => alexander,
      mega_millions.name => alexander,
      mega_millions.name => frederick,
      mega_millions.name => winston,
      cash_5.name => winston
    }
    expect(lottery.registered_contestants).to eq(expected)
  end

  it 'registration' do
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    lottery.register_contestant(alexander, pick_4)
    lottery.register_contestant(alexander, mega_millions)
    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)
    grace.add_game_interest('Mega Millions')
    grace.add_game_interest('Cash 5')
    grace.add_game_interest('Pick 4')
    lottery.register_contestant(grace, mega_millions)
    lottery.register_contestant(grace, cash_5)
    lottery.register_contestant(grace, pick_4)

    expected = {
      pick_4.name => alexander,
      mega_millions.name => alexander,
      mega_millions.name => frederick,
      mega_millions.name => winston,
      cash_5.name => winston,
      mega_millions.name => grace,
      cash_5.name => grace,
      pick_4.name => grace
    }
    expect(lottery.registered_contestants).to eq(expected)
  end


  it 'registration' do
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    lottery.register_contestant(alexander, pick_4)
    lottery.register_contestant(alexander, mega_millions)
    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)
    grace.add_game_interest('Mega Millions')
    grace.add_game_interest('Cash 5')
    grace.add_game_interest('Pick 4')
    lottery.register_contestant(grace, mega_millions)
    lottery.register_contestant(grace, cash_5)
    lottery.register_contestant(grace, pick_4)
    expected = [grace, alexander]
    require 'pry'; binding.pry
    expect(lottery.eligible_contestants(pick_4)).to eq(expected)
  end

end
