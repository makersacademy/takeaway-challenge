require 'order'

describe Order do
  subject(:order) {described_class.new}

  describe '#add' do
    it 'holds the name and quantity of a dish in the basket' do
      order.add("burger", 2)
      expect(order.basket).to include("burger" => 2)
    end
  end

end
