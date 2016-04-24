require 'message'

describe Message do
  subject(:message) { described_class.new }
  let (:t) { Time.new + 60*60 }
  let (:message_body) { "Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!" }

  it 'sends a message confirming the order and that it will bedelivered within one hour' do
    expect(message.send(message_body)).to eq message_body
  end

  it 'calls twilio_send' do
    expect(message).to receive(:twilio_send).with(message_body)
    message.send(message_body)
  end

end
