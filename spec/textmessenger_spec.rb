require 'textmessenger'

describe TextMessenger do

  let(:client) { double :client }

  context "#send_text" do

    it "sends a confirmation text" do
      allow(client).to receive(:send_text)
      time = (Time.now + (60*60)).strftime("%H:%M")
      message = "Thank you! Your order will be delivered before #{time}"
      to_phone = '+447780330410'
      message_body = { from: ENV['TWILIO_PHONE'], to: to_phone, body: message }
      messages = :account, :messages, :create
      allow(client).to receive_message_chain(messages).with(message_body)
      arg1 = ENV['TWILIO_ACCOUNT_SID']
      arg2 = ENV['TWILIO_AUTH_TOKEN']
      expect(Twilio::REST::Client).to receive(:new).with(arg1,arg2) { client }
      subject.send_text
    end
  end
end
