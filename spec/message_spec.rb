require 'message'

describe Message do
  subject(:message) { described_class.new }
  let(:delivery_time) { double :time }
  let(:text) {
    "Thank you! Your order was placed "\
    "and will be delivered before #{delivery_time}"
  }

  it 'sends a formatted text with a delivery time' do
    allow(message).to receive(:send).and_return(text)
    expect(message.send).to eq text
  end
end
