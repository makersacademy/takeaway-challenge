require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#menu' do
    it 'reads the menu' do
      expect(takeaway).to respond_to(:read_menu)
    end
  end
  describe '#order' do
    it 'places an order with quantity' do
      expect(takeaway).to respond_to(:order).with(2).arguments
    end
  end
end
