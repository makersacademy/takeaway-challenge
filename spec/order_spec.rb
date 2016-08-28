require 'order'

describe Order do

  subject(:order) {described_class.new}

  describe '#add(item)' do
    it 'adds item to basket' do
      order.add("margherita")
      expect(order.instance_variable_get(:@basket)).to include "Margherita"
    end

    it 'adds to subtotal' do
      order.add("margherita")
      expect(order.instance_variable_get(:@subtotal)).to eq 6
    end

    it 'records the quantity of an item' do
      2.times {order.add("margherita")}
      expect(order.instance_variable_get(:@basket)["Margherita"]).to eq 2
    end
  end
end
