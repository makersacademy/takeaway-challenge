require 'order'

describe Order do

  subject(:order) {described_class.new}

  context '#add_to_basket' do
    it 'should add the order item and amount the the basket' do
      order.add_to_basket("pizza", 3)
      expect(order.basket).to include("pizza" => 3)
    end
  end
end
