require 'check_order'

describe CheckOrder do

    let(:order_check) {described_class.new}
    let(:order) {double :order}


  describe "#total bill"

    it "responds to total bill" do
      expect(order_check).to respond_to(:total_bill)
    end

  describe "#confirmation" do

    it "should respond to confirmation" do
    expect(subject).to respond_to(:confirmation)
    end

    it "should not send a confirmation text message if the customer says 'n' to the total amount" do
      allow_message_expectations_on_nil
      allow(gets).to receive(:client_response) { "n" }
      #expect(order_check.confirmation).to receive(:client_response).and_return('n')
      expect(order_check.confirmation).to eq nil
    end

     it "should send a confirmation text message if the customer says 'y' to the total amount" do
      allow_message_expectations_on_nil
      allow(gets).to receive(:client_response) { "y" }
       #expect(order_check.confirmation).to receive(:client_response).and_return('n')

      expect(order_check.confirmation).not_to eq nil
    end
  end
end