require 'module_checkout'

class Checkout; include Checkout1; end

describe Checkout do
  it 'can receive an order from a customer' do
    ord = { Burger: 5 }
    allow(subject).to receive(:send_message)
    expect(subject.complete(ord)).to eq 'You ordered: Burger: 5 at a cost of: £'
  end

  xit 'can send a text to a customer' do
    order = double(customer_order: { Burger: 5, Coke: 1 })
    subject.complete(order)
    expect(subject).to receive(:send_message)
  end
end