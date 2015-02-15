require 'order'

describe Order do
  let(:menu) {double :menu}
  let(:customer) {double :customer}
  let(:order) {Order.new(menu, customer)}

  it 'can take an order for 1 item' do
    place_order_helper({Beer: 2}, 4.0, {Beer: 2.0})
    expect(order.customer_order).to eq({ Beer: [2, 4.0] })
  end

  it 'can handle 2 different items on the same order' do
    place_order_helper({Beer: 2, Cod: 2}, 10, { Beer: 2.0, Cod: 3 })
    expect(order.customer_order).to eq({Beer: [2, 4.0], Cod: [2, 6]})
  end

  it 'Raise an error if the total is incorrect' do
    allow(menu).to receive(:menu_items).and_return ( { Beer: 2.0, Cod: 3 } )
    expect { order.place_order({Beer: 2, Cod: 2}, 11) }.to raise_error(RuntimeError, "Total is incorrect, recalculate your order")
  end

  it 'Delete the order if the total is incorrect' do
    allow(menu).to receive(:menu_items).and_return ( { Beer: 2.0, Cod: 3 } )
    expect(order.customer_order.empty?).to be_truthy
  end

  it 'will set the send_sms field to true if the total is correct' do
    place_order_helper({Beer: 2, Cod: 2}, 10, { Beer: 2.0, Cod: 3 } )
    expect(order.send_sms).to be true
  end

  it 'will send off the sms message when the send_sms field is true' do
    place_order_helper({Beer: 2, Cod: 2}, 10, { Beer: 2.0, Cod: 3 })
    expect(order.message_sent).to eq 'Your message was sent'
  end

  it 'will not send a message if send_sms if false' do
    expect(order.send_sms_message).to eq 'No message sent'
  end

  def place_order_helper(item , total, hash_return)
    allow(menu).to receive(:menu_items).and_return( hash_return)
    allow(customer).to receive(:send_sms_to_customer).and_return 'Your message was sent'
    order.place_order(item, total)
  end

end