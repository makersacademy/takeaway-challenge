require "restaurant"

describe Restaurant do 

  describe ".complete_order" do

    it "should raise an error if order.check_total returns false" do 
      order = double("order")
      allow(order).to receive(:check_total) {false}
      expect{subject.complete_order(order)}.to raise_error("There has been an issue with your order, please try again")
    end

    it "should store an order object in the orders array" do
      order = double("order")
      allow(order).to receive(:check_total) {true}
      subject.complete_order(order)
      expect(subject.order_history[0]).to eql(order)
    end 

    it "should set current order to the order passed in" do 
      order = double("order")
      allow(order).to receive(:check_total) {true}
      subject.complete_order(order)
      expect(subject.order).to eql(order)
    end
  end

  describe ".start_order" do 
    it "should create an instance of the order class"do 
    expect(subject.start_order).to be_a Order
  end
end 
end
  