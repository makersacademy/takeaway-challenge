require 'takeaway_restaurant'

describe TakeawayRestaurant do
  it 'has a menu' do
    dishes = [double("Burrito"), double("Pizza")]

    expect(TakeawayRestaurant.new(dishes).menu).to eq(dishes)
  end
end
