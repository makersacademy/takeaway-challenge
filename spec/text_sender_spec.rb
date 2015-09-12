require 'text_sender'
require 'twilio-ruby'

describe TextSender do

  it "sends a message" do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account
    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body: "Test message", to: "447590425818", from: "441496877050", via: client)
    subject.send_text("447590425818", "Test message")

  end

end
