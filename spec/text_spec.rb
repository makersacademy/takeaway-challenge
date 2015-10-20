require 'text'
require 'twilio-ruby'



describe Text do

  it 'sends a message' do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account
    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body: "Test message", to: "447962107779", from: "441604280198", via: client)
    subject.send_text("447962107779","Test message")
  end

end
