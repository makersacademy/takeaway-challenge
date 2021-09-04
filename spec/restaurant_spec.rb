require 'restaurant'

describe Restaurant do
  let(:order) { double :order }
  it 'is able to be passed an order' do
    expect(subject.receive_order(order)).to eq order
  end

  it 'raises error when confirming order without receiving one' do
    expect { subject.confirm_order }.to raise_error 'Restaurant has not received any orders'
  end

  it 'notifies when order has been submitted' do
    allow(subject).to receive(:require)
    subject.receive_order(order)
    expect(subject.confirm_order).to eq 'Order submitted, confirmation text has been sent'
  end
end
