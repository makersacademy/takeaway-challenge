require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish, :name => 'steamed pork dumpling', :price => 1.50 }

  describe '#select_dish' do
    it 'should add a dish to the order' do
      order.select_dish(dish, 1)
      expect(order.dishes).to include(dish: dish, quantity: 1)
    end
  end
end
