require 'order'

describe Order do
  subject(:order) { Order.new }
  describe '#initialize' do
    it 'the basket is empty by default' do
      expect(order.basket).to be_empty
    end
  end
end