require 'twilio_sender'
require 'twilio-ruby'

describe TwilioSender do

  it 'can send a message' do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account
    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body: "Test", to: "____", from: "____", via: client)
    subject.send_text("____", "Test")
  end

end
