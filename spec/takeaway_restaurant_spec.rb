require 'takeaway_restaurant'

describe TakeawayRestaurant do
  let(:burrito) { double("Burrito") }
  let(:pizza) { double("Pizza") }
  let(:takeaway_restaurant) { TakeawayRestaurant.new([burrito, pizza]) }

  it 'has a menu' do
    expect(takeaway_restaurant.menu).to eq([burrito, pizza])
  end

  describe '#order' do
    it 'accepts the orders and the expected total' do
      expect(takeaway_restaurant).to respond_to(:order).with(2).arguments
    end
  end
end
