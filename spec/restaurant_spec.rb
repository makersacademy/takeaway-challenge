require "restaurant"

describe Restaurant do 
=begin
  describe ".check_total" do
    it "should return true if order has been calculated correctly" do
      subject.start_order
      subject.add_items("pizza", "fries")
      expect(subject.check_total).to eql(true)
    end
  end
=end
  describe ".complete_order" do

    it "should raise an error if order has been calculated incorrectly" do 
      subject.calc = 6
      subject.add_items("pizza")
      expect { subject.complete_order }.to raise_error("There has been an issue with your order, please try again later")
    end

    it "should store an order object in the orders array" do
      order = double("order")
      allow(order).to receive(:check_total) { true }
      subject.complete_order
      expect(subject.order_history[0]).to be_a Order 
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
      subject.add_items("pizza", "burger")
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
