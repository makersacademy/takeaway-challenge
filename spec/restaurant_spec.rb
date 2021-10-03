require "restaurant"
require "fakesender"
require "sender"

describe Restaurant do 

  describe ".complete_order" do

    it "should raise an error if order has been calculated incorrectly" do 
      subject.calc = 6
      subject.add_items("pizza", 1)
      expect { subject.complete_order }.to raise_error("There has been an issue with your order, please try again later")
    end

    it "should store an order object in the orders array" do
      subject.complete_order
      expect(subject.order_history[0]).to be_a Order 
    end

    it "should send a message to the users phone with a estimated delivery time" do
      expect(subject.complete_order[0]).to be_a Struct
    end
  end

  describe ".start_order" do 
    it "should create a fresh instance of the order class" do 
      subject.start_order
      expect(subject.order).to be_a Order
    end
  end

  describe ".scrap_order" do 
    it "should create a fresh instance of the order class" do
      subject.add_items("pizza")
      subject.scrap_order
      expect(subject.order.dishes).to eql ([])
    end
  end 

  describe ".view_menu" do 
    it "should display a list of items available" do
      expect(subject.view_menu).to be_a Array
    end
  end

end
