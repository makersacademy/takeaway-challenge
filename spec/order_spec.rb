require 'order'

describe Order do
  let(:test_order) { described_class.new([{ dish: "Sushi", price: 7.50 }]) }
  describe '#initialize' do
    it 'is initialized with dish selection' do
      expect(test_order.selection).to eq [{ dish: "Sushi", price: 7.50 }]
    end
  end

  describe '#add_to_order' do
    it 'allows further dishes to be added to the order' do
      test_order.add_to_order([{ dish: "Noodle Soup", price: 10.00 }, { dish: "Bahn Mi", price: 9.25 }])
      expect(subject.selection).to eq [{ dish: "Sushi", price: 7.50 }, { dish: "Noodle Soup", price: 10.00 }, { dish: "Bahn Mi", price: 9.25 }]
    end
  end

  it 'calculates the total cost of dish selection' 
end
