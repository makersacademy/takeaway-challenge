require 'order'

describe Order do

  let(:order) { Order.new(menu) }
  let(:menu) { double :menu , items: { korma_police: 4.50 } }

  it 'displays a menu' do
    expect { order.see_menu }.to output.to_stdout
  end

  it 'adds an item to the order' do
    order.add(1, 1)
    expect(order.list).to include(1)
  end

  it 'adds more than one item to an order' do
    expect { order.add(1, 2) }.to change { order.list.length }.by(2)
  end

  it 'raises an error if item not on menu' do
    expect { order.add(12, 1) }.to raise_error 'item not on menu'
  end

end
