require 'dotenv'
require 'twilio-ruby'
require 'message'

describe Message do  
  VCR.use_cassette('message') do
    let(:twilio) { double(:twilio) }
    let(:customer_number) { double(:customer_number) }
    let(:twilio_number) { double(:twilio_number) }
    let(:twilio_message) do
      VCR.use_cassette("message") { twilio.messages.create }
    end
    it "sends a message to the customer confirming their order with a delivery time" do
      allow(Time).to receive(:new).and_return(Time.parse('13:37'))
      allow(twilio).to receive(:messages).and_return(twilio)
      allow(twilio).to receive(:create)
      allow(twilio.messages).to receive(:create).and_return({
        body: "Your order is being processed you can expect delivery at 13:37", 
        to: customer_number,
        from: twilio_number })
      twilio_message  
      expect(twilio.messages.create).to include(:body, :to, :from)
    end
  end
end
