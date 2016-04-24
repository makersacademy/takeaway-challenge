require 'message'
require 'twilio-ruby'

describe Message do

  let(:message) { described_class.new }

  describe "#initialize" do
    it "creates twilio client" do

    end
  end


  describe "#send" do
    it "sends a message" do

      message.stub(:twilio_send).and_return(true)
     
      expected_message = "Thank you! Your order was placed and will "\
      "be delivered at 12:00 for £6. \n \n Thanks for your order!"

      expect(message.send(6, "12:00")).to eq expected_message
    end    
  end
end