require 'takeaway'

describe Takeaway do
  subject(:ta) { described_class.new }
  let(:menu) { double(:my_menu) }
  let(:user_order) { "1,1 2,3 20" }
  let(:order_class) { double(:my_order_class, new: order) }
  let(:order) { double(:my_order, price: 20, orders: [1, 1], delivery_time: 'Now', correct?: true, translate: 1) }
  let(:message) { "Your order is complete! Total: £20.00, Arriving by: Now" }
  let(:handler_class) { double(:my_handler_class, new: handler) }
  let(:handler) { double(:my_handler) }

  it 'transforms order into order objects' do
    ta.take_order(user_order, order_class)
    expect(order.price).to eq 20
    expect(order.orders[0]).to eq 1
  end

  it 'notifies customer of successful order' do
    expect(ta.handle_order(user_order, order_class)).to eq message
  end

  it 'throws error if order is incorrect' do
    allow(order).to receive(:correct?) { false }
    expect { ta.handle_order(user_order, order_class) }.to raise_error 'Incorrect Order Received'
  end

  it 'stores order history' do
    ta.handle_order(user_order, order_class)
    expect(ta.order_history.size).to eq 1
  end

  it 'uses smshandler to send confirmation text' do
    allow(handler).to receive(:send_confirmation) { print message }
    expect { ta.order_process(user_order, order_class, handler_class) }
    .to output(message).to_stdout
  end

end
