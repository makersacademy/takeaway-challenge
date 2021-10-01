require 'order'

describe Order do

  describe "#initialize" do
    it "should initialize with a menu array" do
      menu_double = double :menu, new: Array 
      order = Order.new
      expect(order.menu).to be_a Array
    end
  end 

  describe "#add_to_order" do
    # no idea how to test this or what to test
  end
end
