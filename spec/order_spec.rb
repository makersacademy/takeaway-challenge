require 'order'

describe Order do
  describe '#initialisation' do

    it 'is initialised with an empty array' do
      order = Order.new
      expect(order.get(0)).to be_nil
    end
  end
end