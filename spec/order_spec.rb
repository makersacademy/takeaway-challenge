require 'order'

describe Order do
  subject(:order) { described_class.new(:customer, :restaurant) }
  let(:fish) { Dish.new(:Cod,14.99) }
  let(:steak) { Dish.new(:Steak,24.99) }

  describe '#customer' do
    it 'orders have customers' do
      expect(order.customer).to eq(:customer)
    end
  end

  describe '#add_to_order' do
    it 'should add items to order' do
      order.add_to_order(fish, 2)
      order.add_to_order(steak, 3)
      expect(order.order).to contain_exactly(fish, fish, steak, steak, steak)
    end
  end

  describe '#order' do
    it 'orders start off empty' do
      expect(order.order).to be_empty
    end
  end
end
