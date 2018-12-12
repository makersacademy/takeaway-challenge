require 'order'

RSpec.describe Order do

  subject(:order) { described_class.new }

  describe '#add' do

    it 'allows the user to add items and their quantity to the order' do
      expect(order.add("steak", 2, 10)).to include("steak" => { "quantity" => 2, "price" => 10 })
    end
    
  end

  describe '#total_to_pay' do

    it 'sums up how much the user has to pay' do
      order.add("steak", 2, 10)
      order.add("ravioli", 3, 20)
      expect(order.total_to_pay).to equal 80
    end

    it 'returns 0 if no items are added to the order' do
      expect(order.total_to_pay).to equal 0
    end

  end
end
