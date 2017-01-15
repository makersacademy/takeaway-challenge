require 'order'
require 'menu'

describe Order do
  subject(:order) {described_class.new}
  let(:dish) {double :dish}
  let(:dish2) {double :dish}

  describe '#initializing new order' do
    it 'initializes with an empty basket' do
      expect(order.basket).to be_empty
    end

    it 'initializes with a total of 0' do
      expect(order.basket_total).to eq 0
    end
  end

  describe '#adding dishes to your basket' do
    before do
      allow(dish).to receive(:name).and_return("Edamame")
      allow(dish).to receive(:price).and_return(3.50)
    end
    it 'adds an item to the basket' do
      order.add_item(dish, Order::DEFAULT_QUANTITY)
      expect((order.basket).length).to eq 1
    end
  end

  describe '#calculating cost of order' do
    before do
      allow(dish).to receive(:name).and_return("Edamame")
      allow(dish).to receive(:price).and_return(3.50)
      allow(dish2).to receive(:name).and_return("Spicy Tuna Maki")
      allow(dish2).to receive(:price).and_return(5.50)
    end

    it 'calculates the total cost; 1 item, DEFAULT_QUANTITY' do
      expect{ order.add_item(dish, Order::DEFAULT_QUANTITY) }.to change{ order.basket_total }.by(3.50)
    end

    it 'calculates the total cost; 2 items, both DEFAULT_QUANTITY' do
      order.add_item(dish, Order::DEFAULT_QUANTITY)
      order.add_item(dish2, Order::DEFAULT_QUANTITY)
      expect(order.basket_total).to eq(9.00)
    end

    it 'calculates the total cost; 2 items of different quantities' do
      order.add_item(dish, 2)
      order.add_item(dish2, 3)
      expect(order.basket_total).to eq(23.50)
    end
  end
end
