require "./lib/contestant"
require "./lib/game"


RSpec.describe Game do

  it 'exists' do
    pick_4 = Game.new('Pick 4', 2)
    expect(pick_4).to be_a(Game)
  end

  it 'has a name' do
    mega_millions = Game.new('Mega Millions', 5, true)
    expect(mega_millions.name).to eq('Mega Millions')
  end

  it 'has a cost' do
    mega_millions = Game.new('Mega Millions', 5, true)
    expect(mega_millions.cost).to eq(5)
  end

  it 'exists' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    expect(alexander).to be_a(Contestant)
  end

  it 'has a full name' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    expect(alexander.full_name).to eq("Alexander Aigiades")
  end

  it 'has an age' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    expect(alexander.age).to eq(28)
  end

  it 'has a state' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    expect(alexander.state_of_residence).to eq('CO')
  end

  it 'has spending money' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    expect(alexander.spending_money).to eq(10)
  end

  it 'checks out of state' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    expect(alexander.out_of_state?).to eq(false)
  end

  it 'game interests' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    expect(alexander.game_interests).to eq([])
  end

  it 'adds games' do
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    alexander.add_game_interest('Mega Millions')
    alexander.add_game_interest('Pick 4')
    expect(alexander.game_interests).to eq(['Mega Millions', 'Pick 4'])
  end

end
