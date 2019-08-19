require 'sms'

describe Sms do
  let(:client) { double(:client) }
  let(:twilio) { double(:twilio, client: client) }
  let(:twilio_class) { double(:twilio_class, new: twilio) }
  subject(:subject) { described_class.new(twilio_class) }
  it 'can send a message' do
    message = 'Your order was received.'
    twilio_args = { to: ENV["MY_NUMBER"], from: ENV["TWILIO_NUMBER"], body: message }
    expect(client).to receive_message_chain(:api, :account, :messages, :create).with(twilio_args)
    subject.send(message)
  end
end
