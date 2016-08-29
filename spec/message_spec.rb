require 'message'

describe Message do
  let(:message) { described_class.new }

  it 'sends confirmation text to customer' do
    expect(message).to receive(:send_text)
    message.send_text("Test")
  end
end
