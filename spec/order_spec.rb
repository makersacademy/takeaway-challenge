require 'order'
describe Order do
  let(:menu) { double :menu, price: 20 }
  subject(:order) { Order.new(menu) }

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
      order.add("pad thai")
      order.remove("pad thai")
      expect(order.basket).to be_empty
    end
  end  
#come back to this test
  describe '#total' do
    it 'calculates the total price' do
      allow(menu).to receive(:menu).and_return({"Carbonara" => 20})
      order.add("Carbonara")
      order.add("Carbonara")
      expect(order.total).to eq(40)
    end
  end
end
