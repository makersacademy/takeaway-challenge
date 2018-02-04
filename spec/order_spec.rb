require 'restaurant'
require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:restaurant) { Restaurant.new(order) }
  let(:item) { "Pepes ikan" }
  QUANTITY = 2

  describe '#initialize' do 
    it 'initializes with an empty array of items' do 
      expect(order.items).to match_array([])
    end
  end

  describe '#complete' do
    before do 
    restaurant.add_item(item, QUANTITY)
    order.complete
    end 
    it 'adds the correct amount to the bill' do 
      expect(order.bill).to eq (Restaurant::MENU[item] * QUANTITY)
    end
  end
end
