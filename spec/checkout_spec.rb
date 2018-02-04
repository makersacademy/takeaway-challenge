require 'checkout'

describe Checkout do

  subject(:checkout)      { described_class.new(order_total, messaging_service) }
  let(:phone_number)      { double "a phone number" }
  let(:order_total)       { double "an order total" }
  let(:messaging_service) { double "a messaging service", send_sms: sms_sent }
  let(:sms_sent)          { double "an sms has been sent" }

  describe "#pay" do
    context "when payment is incorrect" do
      let(:incorrect_payment) { double "incorrect payment" }
      it "raises 'Incorrect money provided' error" do
        error_msg = "Incorrect money provided"
        expect { checkout.pay(incorrect_payment, phone_number) }.to raise_error error_msg
      end
    end

    context "when payment is correct" do
      let(:correct_payment) { order_total }
      it "returns thank you message" do
        thank_you_msg = "Thank you. Your order has been placed. "\
        "You will receive confirmation by text message"
        expect(checkout.pay(correct_payment, phone_number)).to eq thank_you_msg
      end

      it "calls #send_sms" do
        expect(checkout).to receive(:send_sms).with(phone_number)
        checkout.pay(correct_payment, phone_number)
      end

      it "calls messaging_service::send_sms" do
        expect(messaging_service).to receive(:send_sms).with(phone_number)
        checkout.pay(correct_payment, phone_number)
      end
    end
  end
end
