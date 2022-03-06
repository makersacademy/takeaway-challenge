require 'text_message'

describe TextMessage do
  subject(:text) { described_class.new(client) }
  let(:client) { double :client }

  it 'can create a TextMessage' do
    expect(text).to be_a_kind_of(TextMessage)
  end

  it 'responds to send_message method' do
    expect(text).to respond_to(:send_message)
  end

  describe '#send_message' do
    it 'sends a confirmation text message' do
      allow(client).to receive_message_chain(:messages, :create).and_return("Thank you for your order!")
      expect(text.send_message).to eq "Thank you for your order!"
    end
  end
end
