require 'textmessenger'

describe TextMessenger do

  let(:client) { double :client }

  context "#send_text" do

    it "notifies user that they will receive an SMS" do
      message = "You will shortly receive an SMS confirming your order."
      allow(subject).to receive(:send_text) { message }
      expect(subject.send_text).to eq message
    end

    it "sends a confirmation text" do
      allow(client).to receive(:send_text)
      time = (Time.now + (60*60)).strftime("%H:%M")
      message = "Thank you! Your order will be delivered before #{time}"
      to_phone = '+447780330410'
      twilio_message_body = { from: ENV['TWILIO_PHONE'], to: to_phone, body: message }
      messages = :account, :messages, :create
      allow(client).to receive_message_chain(messages).with(twilio_message_body)
      expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
      subject.send_text
    end
  end
end
