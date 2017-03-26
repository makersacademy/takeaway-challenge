require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  describe '#initialize' do
    it 'has a menu object' do
      expect(takeaway.menu).to be_a(Menu)
    end
    it 'has an order object' do
      expect(takeaway.order).to be_a(Order)
    end
    it 'has a pricecheck object' do
      expect(takeaway.pricecheck).to be_a(PriceCheck)
    end
  end



end
