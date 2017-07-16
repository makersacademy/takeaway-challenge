require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:requested_dishes) { [dish1, dish2] }
  let(:correct_cost) { 15 }
  let(:dish1) { double :dish1, name: "Burrito", price: 5 }
  let(:dish2) { double :dish1, name: "Pizza", price: 10 }

  describe '#calculate_cost' do
    it 'should calculate the cost of an order' do
      expect(order.calculate_cost(requested_dishes)).to eq correct_cost
    end
  end
end
