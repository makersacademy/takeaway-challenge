require 'text_sender'
require 'twilio-ruby'

describe TextSender do

  it "sends a message" do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account
    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body: "Test message", to: "447963648096", from: "441322721396", via: client)
    subject.send_text("447963648096", "Test message")

  end

end