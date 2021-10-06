require 'checkout'

describe Checkout do
  describe "#send_notification" do
    it "should send an SMS with the delivery time window" do
      checkout = Checkout.new
      # expect(checkout.send_notification).to do something with Twilio
      # no idea how to test this
    end
  end
end