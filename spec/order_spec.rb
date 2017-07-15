require 'order'

describe Order do

  numbers = [1, 1]
  subject(:order) { described_class.new(numbers) }

  describe '#initialize' do

    it 'creates a new menu selection' do
      expect(subject.current_order).not_to be_nil
    end
  end

  describe '#total' do
    it 'returns the total cost of an order' do
      expect(order.total).to eq 11
    end
  end

end
