require 'checkout'

describe Checkout do

  subject(:checkout)      { described_class.new(order_total, phone_number, messaging_service) }
  let(:phone_number)      { double "a phone number" }
  let(:order_total)       { double "an order total" }
  let(:messaging_service) { double("a messaging service") }
  let(:sms_sent)          { double("an sms has been sent") }
  let(:body)              { "Thank you for your order. "\
      "It will be delivered at #{Time.now.strftime "%H:%M"}"
  }

  describe "#send_sms" do
    it "calls TwilioSendSMS::send_sms" do
      allow(messaging_service).to receive(:send_sms).and_return sms_sent
      expect(messaging_service).to receive(:send_sms).with(phone_number, body)
      checkout.send_sms
    end
  end

end
