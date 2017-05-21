require './lib/order'

describe Order do

  context '#add' do
    it 'stores order into hash' do
      order = Order.new
      expect(order.list.length).to eq 0
    end
  end

end
