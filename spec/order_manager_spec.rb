require 'order_manager'

describe OrderManager do

  let ( :order_manager) {described_class.new(DishInventory.new)}
  let (:order) {double :order}
  let (:payment) {double :payment}


  describe "New instance of order manager" do
    it "takes a parameter that expects an object that knows how to respond to an inventory" do
      expect(order_manager.inventory).to be_instance_of (DishInventory)
    end
  end

  describe "creating a new order" do
    it "should have a method that creates a new order instance" do
      expect(order_manager.create_order).to be_instance_of (Order)
    end
  end

  describe "During the order" do
    it "should see the current order "
  end

    describe "Submitting an order" do

      it "should respond to submit_order with one argument" do
        expect(order_manager).to respond_to(:submit_order).with(2).arguments
      end

      it "should submit an order" do
        order_manager.submit_order(order,payment)
        expect(order_manager.order).to eq order_manager.order
      end



    end

    describe "Order Verification" do
      
      it "should respond to is_payment_correct with two arguments " do
        expect(order_manager).to respond_to(:is_payment_correct?).with(2).argument
      end
    end

end
