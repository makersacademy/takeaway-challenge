require 'module_checkout'

class Checkout; include Checkout1; end

describe Checkout do
  it 'can receive an order from a customer' do
    ord = { Burger: 5 }
    allow(subject).to receive(:send_message)
    expect(subject.complete(ord)).to eq 'You ordered: Burger: 5 at a cost of: £'
  end

  it 'can send a text to a customer' do
    order = { Burger: 5, Coke: 1 }
    expect(subject).to receive(:send_message)
    subject.complete(order)
  end
end