require 'text'
require 'twilio-ruby'

describe Text do
  describe '#send_sms' do
    it 'sends sms confirmation of customer order' do
      messages = double :messages, create: nil
      account = double :account, messages: messages
      client = double :client, account: account

      allow(Twilio::REST::Client).to receive(:new) { client }
      expect(messages).to receive(:create).with(body: "Thank you! Your order"\
      " has been placed and will be delivered before "\
      "#{(Time.new + 3600).strftime("%H:%M")}.", to: ENV['NUMBER'],
      from: ENV['TWILIO'])
      subject.send_text
    end
  end

end
