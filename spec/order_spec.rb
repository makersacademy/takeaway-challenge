require 'menu'
require 'order'

describe Order do
  context 'ordering module' do
    it 'selects an item' do
      vn = Menu.new
      order = Order.new(vn)
      expect(order.select("001", "1")).to eq("001")
    end
  end
end
