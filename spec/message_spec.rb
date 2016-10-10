require 'message'

describe Message do
  subject(:message) {described_class.new}

  it 'responds to send_message' do
    expect(message).to receive(:send_message)
    message.send_message
  end

  it 'has a number to send from' do
    expect(message.from).not_to eq nil
  end

  it 'has a number to send to' do
    expect(message.to).not_to eq nil
  end
end
