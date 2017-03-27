require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish) { double :dish, name: 'Salad', price: 1.50 }

  describe '#add_dish' do
    it 'stores ordered dishes' do
      order.add_dish(dish)
      expect(order.dishes).to eq [dish]
    end
  end

  describe '#total' do
    it 'returns the total cost of the order' do
      order.add_dish(dish)
      expect(order.total).to eq 1.50
    end
  end

  describe '#reset' do
    it 'resets the dishes to empty' do
      order.add_dish(dish)
      order.reset
      expect(order.dishes).to eq []
    end
  end

end
