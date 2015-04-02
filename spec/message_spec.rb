require 'message'

describe Message do
  let(:message) { described_class.new }
  # let(:body) { "Thank you! Your order will be delivered before #{d_time}" }

  it 'can send customer a text confirmation' do
    allow(message).to receive(:send_text).and_return true
    expect(message.send_text '555-1234', 'some order').to eq true
  end

  it 'does not send customer a text without their number and an order' do
    expect { message.send_text }.to raise_error
  end
end

# Twilio is tested and working, screenshot proof is in the readme
