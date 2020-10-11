require 'order'
describe Order do
  subject(:order) { Order.new }

  describe '#initialize' do
    it 'initializes with an empty basket' do 
      expect(order.basket).to eq({})
    end
  end

  describe '#add_to_basket' do
    it 'adds order input to basket' do
      order.add("steak", 2)
      expect(order.basket).to eq({"steak" => 2})
    end
  end

  describe '#remove_from_basket' do
    it 'removes food from basket' do
      order.add("pineapple")
      order.remove("pineapple")
      expect(order.basket).to be_empty
    end
  end  
end
