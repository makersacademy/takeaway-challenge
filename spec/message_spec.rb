require 'dotenv'
require 'twilio-ruby'
require 'message'

describe Message do  
  VCR.use_cassette('message') do
    let(:twilio) { double(:twilio) }
    let(:customer_number) { double(:customer_number) }
    let(:twilio_number) { double(:twilio_number) }
    let(:twilio_message) do
      VCR.use_cassette("message") { subject.sms(customer_number) }
    end
    it "sends a message to the customer confirming their order with a delivery time" do
      allow(Time).to receive(:new).and_return(Time.parse('13:37'))
      allow(twilio).to receive(:messages).and_return(twilio)
      expect(twilio.messages).to receive(:create).with( {
        body: "Your order is being processed you can expect delivery at 13:37", 
        to: customer_number,
        from: twilio_number } )
      twilio_message        
    end
  end
end
