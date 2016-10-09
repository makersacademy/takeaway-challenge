require 'message'

describe Message do
  subject(:message) {described_class.new(+447659234890, +447654290837)}

  it 'responds to send_message' do
    expect(message).to respond_to(:send_message)
  end

  it 'has a number to send from' do
    expect(message.from).not_to eq nil
  end

  it 'has a number to send to' do
    expect(message.to).not_to eq nil
  end
end
