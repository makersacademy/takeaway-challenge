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
    it "it raises an error when order isn't on the menu" do
      message = 'Sorry, this dish is currently not on the menu'
      expect{ takeaway.order(:chicken_tandori) }.to raise_error message
    end
  end
  describe '#total' do
    it 'gives the total of the orders' do
      expect(takeaway).to respond_to(:total)
    end
  end
end
