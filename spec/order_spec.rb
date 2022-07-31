require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { Menu.new.parse_file }

  it 'lets the customer select a number of available dishes' do
    order.select(0, menu, 1)
    expect(order.pad).to eq([{ name: 'item1', cost: 1.0, amount: 1 }])
  end

  it 'adds a number of dishes to order' do
    order.select(0, menu, 1)
    order.select(1, menu, 1)
    expect(order.pad).to eq([{ name: 'item1', cost: 1.0, amount: 1 }, { name: 'item2', cost: 2.0, amount: 1 }])
  end

  it 'raises error if order isn\'t on menu' do
    expect { order.select(6, menu, 1) }.to raise_error('That\'s not on the menu I\'m afraid')
  end
end
