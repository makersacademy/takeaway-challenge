require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:order) { [dish1, dish2] }
  let(:correct_cost) { 15 }
  let(:dish1) { double :dish1, name: "Burrito", price: 5 }
  let(:dish2) { double :dish1, name: "Pizza", price: 10 }

  describe '#calculate_cost' do
    it 'should calculate the cost of an order' do
      expect(takeaway.calculate_cost(order)).to eq correct_cost
    end
  end
end
