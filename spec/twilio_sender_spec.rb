require 'twilio_sender'
require 'twilio-ruby'

describe Twilio_Sender do

  it 'can send a message' do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account
    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body: "Test", to: "447825786185", from: "441767512027", via: client)
    subject.send_text("447825786185", "Test")
  end

end
