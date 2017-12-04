require 'message'

describe TextMessage do
  let(:message) { TextMessage.new }
  let(:send_confirmation_message) { double(:send_confirmation_message) }

  it 'should send a message to the user' do
    expect(message).to receive(:send_sms).and_return("Order successful")
    message.send_sms
  end
end
