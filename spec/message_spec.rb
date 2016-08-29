require 'message'

describe Message do
  let(:message) { described_class.new }
  let(:order) { double :order, order_total: 1, basket_total: 1 }

  it 'sends confirmation text to customer' do
    allow(order).to receive(:basket_empty?).and_return(true)
    expect(message).to receive(:send_text)
  end
end
