require 'message'
require 'twilio-ruby'

describe Message do
  let(:message) { described_class.new }

  describe "#send" do
    it "sends a message" do
      message.stub(:twilio_send).and_return(true)
      expected_message = "Thank you! Your order was placed and will "\
      "be delivered at 12:00 for £6. \n \n Thanks for your order!"
      expect(message.send(6, "12:00")).to eq expected_message
    end    
  end

  describe "#twilio_send" do
    it "shoudn't send a message while testing" do
      message.stub(:twilio_send).and_return(true)
      expect(message.twilio_send).to eq true 
    end
  end
end