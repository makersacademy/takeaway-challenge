require 'restaurant'

describe Restaurant do
  let(:order) { double :order }
  it 'is able to be passed an order' do
    expect(subject.receive_order(order)).to eq order
  end

  it 'raises error when confirming order without receiving one' do
    expect { subject.confirm_order }.to raise_error 'Restaurant has not received any orders'
  end
end