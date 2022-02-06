require_relative '../lib/message'

describe Message do
  subject(:message) { described_class.new }

  it 'sends a message' do
    expect(message).to receive(:send)
    message.send
  end
  
end
