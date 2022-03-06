require 'order'

describe Order do
  
  describe ".add_order" do
    it "should add order to the order list" do
      menu = Menu.new
      order = Order.new(menu)
      order.add_order(1, 2)
      expect(order.order_list).to eq "Vegan Burger" => 2
    end

  end

end
