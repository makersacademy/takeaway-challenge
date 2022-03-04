require 'order'

describe Order do
  
  describe ".take_order" do
    it "should ask for the order" do
      menu = Menu.new
      order = Order.new(menu)
      order.take_order
      expect(order.order_list).to eq order.order_list
    end

  end
    
end