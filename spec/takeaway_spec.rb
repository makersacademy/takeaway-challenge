require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu)}
  let (:menu) {double(:menu, print_menu: printed_menu)}
  let (:order) {double :order}
  let (:payment) {double :payment}
  let (:message) {double :message}
  let(:printed_menu) {"Chicken Tikka Masala: £6.30"}

  let(:menu) {}


describe "Printing out the menu" do
  it "display menu shows the list of available food options from the menu object" do
    allow(menu).to receive(:print_menu).and_return(printed_menu)
    expect(takeaway.show_menu).to eq printed_menu
  end
end

  describe "creating a new order" do
    it "should have a method that creates a new order instance" do
      expect(takeaway.create_order).to be_instance_of (Order)
    end
  end

    describe "Submitting an order" do

      it "should respond to submit_order with one argument" do
        expect(takeaway).to respond_to(:submit_order).with(2).arguments
      end

      it "should return a string that confirms the price of order" do
        allow(order).to receive(:total_cost).and_return payment
        expect(takeaway.submit_order(order,payment)).to eq "The total cost is"
      end

      it "should raise an error if the payment given does not equal the total cost of the order" do
        allow(order).to receive(:total_cost).and_return !payment
        expect{takeaway.submit_order(order,payment)}.to raise_error "This total is not correct"
      end

    end

    describe "Sending SMS" do
      before do
        allow(order).to receive(:total_cost).and_return payment
      end

      it "Message cannot be sent if sms permission is not granted" do
        allow(takeaway).to receive(:granted_permission?).and_return false
        expect(takeaway.submit_order(order,payment)).to eq "Message not sent"
      end
    end

end
