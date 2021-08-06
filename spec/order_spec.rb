require 'order'

describe Order do

  let(:order) { Order.new(selection) }
  let(:selection) { [{ dish: "Sushi", price: 7.50 }] }

  describe '#initialize' do
    it 'is initialized with customers\' dish selection' do
      expect(order.selection).to eq [{ dish: "Sushi", price: 7.50 }]
    end
  end

  describe '#add_to_order' do
    it 'allows further dishes to be added to the order' do
      order.add_to_order([{ dish: "Noodle Soup", price: 10.00 }, { dish: "Bahn Mi", price: 9.25 }])
      expect(order.selection).to eq [{ dish: "Sushi", price: 7.50 }, { dish: "Noodle Soup", price: 10.00 }, { dish: "Bahn Mi", price: 9.25 }]
    end
  end

  describe '#cost_calculator' do
    it 'calculates the total cost of dish selection' do
      expect(order.cost_calculator).to eq 7.50
    end
  end
end
