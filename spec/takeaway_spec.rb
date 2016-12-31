require 'takeaway'

describe Takeaway do

  let (:menu) {double(:menu, print_menu: printed_menu)}
  subject(:takeaway) {described_class.new(menu)}
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


    describe "Submitting an order" do

      before do
        allow(takeaway).to receive(:granted_permission?).and_return false
      end

      it "should respond to submit_order with one argument" do
        expect(takeaway).to respond_to(:submit_order).with(2).arguments
      end

      it "should return a string that confirms the price of order" do
        allow(order).to receive(:total_cost).and_return payment
        expect(takeaway.submit_order(order,payment)).to eq "Message sent"
      end

      it "should raise an error if the payment given does not equal the total cost of the order" do
        allow(order).to receive(:total_cost).and_return !payment
        expect{takeaway.submit_order(order,payment)}.to raise_error "This total is not correct"
      end

    end

end
