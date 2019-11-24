require "text_provider"

describe TextProvider do
  let(:text_provider) { TextProvider.new }
  let(:client) { double :client }

  describe "#send_text" do
    it "should be able to send a text message to confirm successful order and 1 hour delivery time" do
      message = "Thank you! Your order was placed and will be delivered before 18:55"
      twilio_message_body = { from: ENV['TWILIO_PHONE_NUMBER'], to: ENV['MY_PHONE_NUMBER'], body: message }
      allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
      expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
      text_provider.send_text("18:55")
    end
  end
end
