require 'order'

describe Order do
  subject(:order){ described_class.new }

  describe '#order_pizza' do
    it 'allow the customer to select a pizza from the menu' do
      expect(order.order_pizza).to eq 'diavola'
    end
  end

  describe '#select_quantity' do
    it 'allow the customer to select quantity' do
      expect(order).to respond_to(:select_quantity)
    end
  end

end
