require 'dotenv'
require './lib/twilio_notification.rb'

describe TwilioNotification do

  subject(:text) { described_class.new }

  context '#send_message' do
    it 'allows user to receive text confirmation message' do
      sid_double = double
      auth_double = double
      text = TwilioNotification.new(sid_double, auth_double)
      message = "Thank you! Your order was placed and will be with you by #{text.delivery}"
      twilio_message_body = { from: ENV['TWILIO_PHONE'], to: ENV['RECEIVER'], body: message }
      allow(text.client).to receive_message_chain(:messages, :create).with(twilio_message_body)
      expect(text.send_message).to eq "Message sent."
    end
  end
end
