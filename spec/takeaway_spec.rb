require 'takeaway'

describe Takeaway do
  subject(:ta) { described_class.new }
  let(:menu) { double(:my_menu) }
  let(:user_order) { "1,1\n2,3\n20.50" }
  let(:order_intermediate) { double(:my_order_intermediate, new: order) }
  let(:order) { double(:my_order, price: 20.50, orders: [1, 1], time: 'Now', correct?: true, translate: 1) }
  let(:message) { "Your order is complete! Total: £20.50, Arriving by: Now" }

  it 'transforms order into order objects' do
    ta.take_order(user_order, order_intermediate)
    expect(order.price).to eq 20.50
    expect(order.orders[0]).to eq 1
  end

  it 'notifies customer of successful order' do
    expect(ta.handle_order(user_order, order_intermediate)).to eq message
  end

  it 'throws error if order is incorrect' do
    allow(order).to receive(:correct?) { false }
    expect { ta.handle_order(user_order, order_intermediate) }.to raise_error 'Incorrect Order Received'
  end

end
