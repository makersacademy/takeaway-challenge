require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#current_order' do
    it 'is empty by default' do
      expect(takeaway.order).to be_empty
    end
  end

  describe '#add_to_order(dish, quantity)' do
    it 'can add a quantity of a dish to the current order' do
      takeaway.add_to_order('pizza', 1)
      expect(takeaway.order).to include [ 'pizza', 1 ]
    end
  end

  describe '#bill_calc' do
    it 'returns the order\'s bill' do
      takeaway.add_to_order('pizza', 2)
      takeaway.add_to_order('chips', 1)
      expect(takeaway.bill_calc).to eq(15)
    end
  end

  describe '#place_order(expected_bill)' do
    it 'raises an error if bill and expected bill are different' do
      different = 'bill and expected bill are different'
      takeaway.add_to_order('pizza', 2)
      takeaway.add_to_order('chips', 1)
      expect{ takeaway.place_order(10) }.to raise_error different
    end

    it 'confirms that the order was placed successfully' do
      takeaway.add_to_order('pizza', 2)
      takeaway.add_to_order('chips', 1)
      expect(takeaway.place_order(15)).to eq 'order successfully placed'
    end
  end
end
