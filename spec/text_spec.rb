require 'text'
require 'twilio-ruby'

describe Text do

  it 'can send message to confirm order' do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account

    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(
    body: "Your order has been confirmed. It will be delivered before" \
      " #{(Time.new + 3600).strftime("%H:%M")}",
    to: 447400606699,
    from: 441793250274)
    subject.send_message
  end
end
