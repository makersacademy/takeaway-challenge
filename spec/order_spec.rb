require 'order'

describe Order do
  let(:menu) {double :menu}
  let(:order) {Order.new(menu)}

  it 'can take an order for 1 item' do
    allow(menu).to receive(:menu_items).and_return ( {Beer: 2.0} )
    order.place_order({Beer: 2}, 4.0)
    expect(order.customer_order).to eq({ Beer: [2, 4.0] })
  end

  it 'can handle 2 different items on the same order' do
    allow(menu).to receive(:menu_items).and_return ( { Beer: 2.0, Cod: 3 } )
    order.place_order({Beer: 2, Cod: 2}, 10)
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

  it 'will send an order if the order total is correct' do
    allow(menu).to receive(:menu_items).and_return ( { Beer: 2.0, Cod: 3 } )
    order.place_order({Beer: 2, Cod: 2}, 10)
    expect(order.send_sms).to be_truthy
  end







end