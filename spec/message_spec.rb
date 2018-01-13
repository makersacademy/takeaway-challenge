require 'message'

describe TextMessage do
  let(:message) { TextMessage.new }

  it 'should send a message to the user' do
    expect(message).to receive(:send_sms).and_return("Order successful")
    message.send_sms
  end

end
