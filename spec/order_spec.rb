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

  

  describe '#total_cost' do
    it 'returns the total cost of the order' do
    end
  end



end
