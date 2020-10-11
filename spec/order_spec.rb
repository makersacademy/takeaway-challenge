require 'order'
describe Order do
  subject(:order) { Order.new }
#   let(:menu) { double :menu }

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

  describe '#total' do
    it 'calculates the total price' do
    #   allow(menu).to receive(:menu).and_return(20)
      order.add("Carbonara")
      order.add("Carbonara")
      expect(order.total).to eq(30)
    end
  end
end
