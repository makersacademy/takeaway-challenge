require 'order_manager'

describe OrderManager do

  let ( :order_manager) {described_class.new(DishInventory.new)}
  let (:order) {double :order}
  let (:payment) {double :payment}
  let (:message) {double :message}


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

    describe "Submitting an order" do

      it "should respond to submit_order with one argument" do
        expect(order_manager).to respond_to(:submit_order).with(2).arguments
      end

      it "should raise an error if the payment given does not equal the total cost of the order" do
        allow(order).to receive(:total_cost).and_return !payment
        expect{order_manager.submit_order(order,payment)}.to raise_error "This total is not correct"
      end

    end

    describe "Order Verification" do

      it "should respond to is_payment_correct with two arguments " do
        expect(order_manager).to respond_to(:is_payment_correct?).with(2).argument
      end
    end

    describe "Sending SMS" do
      before do
        allow(order).to receive(:total_cost).and_return payment
      end
      
      it "Message cannot be sent if sms permission is not granted" do
        allow(order_manager).to receive(:granted_permission?).and_return false
        expect(order_manager.submit_order(order,payment)).to eq "Message not sent"
      end
    end

end
