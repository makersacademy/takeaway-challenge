require 'takeaway'

describe TakeAway do

  it 'prints list of food and prices' do
    expect(subject.food_prices).to include(:chips => 5.50, :wings => 7.20, :burger => 8.50)
  end

end
