require 'menu'
require 'order'

describe Order do
  context 'ordering module' do

    it 'selects an item' do
      vn = Menu.new
      order = Order.new(vn)
      expect(order.select("002", "3")).to eq([{ :ref => "002", \
        :quantity => "3", :name => "Soft Shell Crab", :charge => 31.5, \
        :price => 10.5 }])
    end
    it 'provides a total' do
      vn = Menu.new
      order = Order.new(vn)
      order.select("002", "3")
      order.select("003", "5")
      expect(order.print).to include("Total cost is 54.0")
    end
  end
  context ' list checking' do
    it 'checks the order against a customer list' do
      vn = Menu.new
      order = Order.new(vn)
      cust_order = []
      cust_order  << { :ref => "001", :quantity => "2" }
      cust_order  << { :ref => "003", :quantity => "2" }
      expect(order.check(cust_order, 40)).to eq("OK")
    end
    it "rejects orders where the quantities don't match the total" do
      vn = Menu.new
      order = Order.new(vn)
      cust_order = []
      cust_order  << { :ref => "001", :quantity => "8" }
      cust_order  << { :ref => "002", :quantity => "4" }
      expect { order.check(cust_order, 220) }.to raise_error("Error in order")
    end
  end
end
