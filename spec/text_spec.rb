require 'text'

describe Text do
  it 'sends a message' do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account
    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body:
      "Thank you! Your order was placed and will" \
        " be delivered within the next hour.",
      to: '+447415121250',
      from: '+442820032756')
    subject.send_message('+447415121250')
  end
end
