require 'order'

describe Order do

  let(:order) { Order.new}
  let(:selection) { [{ dish: "Sushi", price: 7.50 }] }

  describe '#initialize' do
    it 'is initialized as a blank waiter\s pad' do
      expect(subject.selection).to eq []
    end
  end

  describe '#add_to_order' do
    it 'allows further dishes to be added to the order' do
      subject.add_to_order([{ dish: "Noodle Soup", price: 10.00 }])
      subject.add_to_order([{ dish: "Bahn Mi", price: 9.25 }])
      expect(subject.selection).to eq [{ dish: "Noodle Soup", price: 10.00 }, { dish: "Bahn Mi", price: 9.25 }]
    end
  end

  describe '#cost_calculator' do
    it 'calculates the total cost of dish selection' do
      subject.add_to_order(selection)
      expect(subject.cost_calculator).to eq 7.50
    end
  end
end
