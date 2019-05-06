require 'messaging'

describe Messaging do

  subject(:messaging) { described_class.new(client) }
  let(:client) { double }
  let(:messages) { double }
  let(:message) { double }

  # Mocking the send method

  it 'sends a message successfully' do

    allow(client).to receive(:messages).and_return(messages)

    allow(messages).to receive(:create)

    expect(messages).to receive(:create).with(hash_including(:body => message))
    
    messaging.send(message)

  end

end
