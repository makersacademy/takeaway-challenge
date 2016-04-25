require 'message'

describe Message do
  subject(:message) { described_class.new }
  let (:t) { Time.new + 60*60 }
  let (:message_body) { "Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!" }
  let (:TWILIO_ACCOUNT_SID) { 'SID' }
  let (:TWILIO_AUTH_TOKEN) { 'TOKEN' }

  it 'sends a message confirming the order and that it will bedelivered within one hour' do
    expect(message.send(message_body)).to eq message_body
  end

  it 'calls twilio_send' do
    expect(message).to receive(:twilio_send).with(message_body)
    message.send(message_body)


    # message = 'order complete'
    # twilio_message_body = { from: ENV['TWILIO_PHONE'], to: ENV['TWILIO_DESTINATION_PHONE'], body: message }
    # allow(@client).to receive_message_chain(:account, :messages, :create).with(twilio_message_body)
    # expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(@client)
    # subject.send(message)
  end

end
