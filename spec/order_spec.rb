require './lib/order.rb'

describe Order do
  let(:order) { described_class.new }
  let(:menu_items) { [{ pizza: 10 }, { burger: 15 }] }

  describe '#variables' do
    it 'Should have an empty basket by default' do
      expect(order.basket).to be_empty
    end

    it 'Should have a default total price of 0' do
      expect(order.total_price).to eq 0
    end
  end

  describe '#calculate_price' do
    it 'Should calculate the total price of the basket' do
      order = Order.new(menu_items)
      order.calculate_price
      expect(order.total_price).to eq 25
    end
  end

  describe '#order_summary' do
    it 'Should convert the basket array into a readable string' do
      order = Order.new(menu_items)
      expect(order.basket_summary).to eq ['pizza = £10', 'burger = £15']
    end
  end
end
