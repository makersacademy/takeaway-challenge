require 'menu'
require 'order'

describe Order do
  context 'ordering module' do
    it 'selects an item' do
      vn = Menu.new
      order = Order.new(vn)
      expect(order.select("002", "3")).to eq([{:ref=>"002", :name=>"Soft Shell Crab", :charge=>31.5}])
    end
    it 'adds up the order total' do
      vn = Menu.new
      order = Order.new(vn)
      order.select("002", "3")
      order.select("003", "5")
      expect(order.total).to eq(54)
    end
  end
end
