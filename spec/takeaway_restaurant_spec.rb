require 'takeaway_restaurant'

describe TakeawayRestaurant do
  let(:burrito) { double("Burrito", :price => 7.50) }
  let(:pizza) { double("Pizza", :price => 11.00) }
  let(:takeaway_restaurant) { TakeawayRestaurant.new([burrito, pizza]) }

  it 'has a menu' do
    expect(takeaway_restaurant.menu).to eq([burrito, pizza])
  end

  describe '#order' do
    it 'accepts the orders and the expected total' do
      expect(takeaway_restaurant).to respond_to(:order).with(2).arguments
    end

    it 'raises an error if expected and actual total differ' do
      expect {(takeaway_restaurant.order([
        { :dish => burrito, :portion => 2 },
        { :dish => pizza, :portion => 1 }
        ], burrito.price * 2)) }.to raise_error("Total is not correct")
    end
  end
end
