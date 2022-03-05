require 'order'

describe Order do
  
  describe ".add_order" do
    it "should add order to the order list" do
      menu = Menu.new
      order = Order.new(menu)
      order.add_order(1, 2)
      expect(order.order_list).to eq "Vegan Burger"=>2
    end

  end

  describe ".take_order" do
    it "should ask for the order" do
      menu = Menu.new
      order = Order.new(menu)
      order.take_order(1, 2)
      order.take_order(2, 1)
      expect(order.order_list).to eq "Ealing + Chips"=>1, "Vegan Burger"=>2
    end

  end

end