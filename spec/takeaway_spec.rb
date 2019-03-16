require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new() }
  
  describe "#menu" do
    it 'returns an array' do
      expect(takeaway.menu).to_not be_empty
    end
  end

  describe "#add_to_order" do
    it 'adds a dish to the order in the correct quantity' do
      takeaway.add_to_order(takeaway.menu[3], 2)
      expect(takeaway.get_order.count(takeaway.menu[3])).to eq 2
    end
    it 'raises an error if the item is not on the menu' do
      expect { takeaway.add_to_order("", 1) }.to raise_error "Cannot add to order: item is not available. Select items from the menu."
    end
  end

  describe "#get_order" do
    it 'returns something countable' do
      expect(takeaway.get_order).to respond_to(:count)
    end
  end
end
