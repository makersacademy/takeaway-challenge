require 'order'

describe Order do
  
  # describe ".take_order" do
  #   it "should ask for the order" do
  #     menu = Menu.new
  #     order = Order.new(menu)
  #     order.take_order
  #     expect(order.order_list).to eq "burger"
  #   end

  # end

  # testing for order 2 Vegan Burgers and 1 Ealing + Chips
  describe ".total_amount" do
    it "should return the total cost of the order" do
      menu = Menu.new
      order = Order.new(menu)
      order.take_order
      expect(order.total_amount).to eq 45
    end

  end
    
end