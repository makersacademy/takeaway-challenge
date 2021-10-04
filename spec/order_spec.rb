require 'order'

RSpec.describe Order do
  describe "#init" do
    it "creates instance of type Order" do
      order = Order.new  
      expect(order).to be_instance_of Order
    end

    it "creates the order_dict with all quantities 0" do
      expect(subject.order).to eq({"pasta": 0, "salad": 0, "roast": 0, "soup": 0})
    end
  end

  describe "add_dish" do
    it 'increase quantity of a dish by 1' do
      order = Order.new
      order.add_dish("pasta")
      expect(order.order["pasta"]).to eq 1
    end
    
    it "raises that we don't have the dish if we don't have it" do
      expect{subject.add_dish("noodles")}.to raise_error "We don't have that dish"
    end

  end
end
