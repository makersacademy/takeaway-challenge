require 'checkout'

describe Checkout do

  subject(:checkout) { described_class.new(order_total, phone_number) }
  let(:phone_number) { double "a phone number" }
  let(:order_total)  { double "an order total" }

  describe "#send_sms" do
    let(:messaging_service) { double("a messaging service") }
    let(:body)              { double("a string") }
    it "calls TwilioSendSMS::send_sms" do
      allow(messaging_service).to receive(:send_sms)
      expect(messaging_service).to receive(:send_sms).with(phone_number, body)
      checkout.send_sms
    end
  end

end
