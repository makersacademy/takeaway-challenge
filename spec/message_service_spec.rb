require 'message_service'

describe MessageService do
  it 'can send a message' do
    expect(MessageService.new).to respond_to(:send_message).with(1).argument
  end
end
