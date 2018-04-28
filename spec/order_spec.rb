require 'order'

describe Order do

  let(:order) { Order.new }
  let(:menu) { double :menu, items: { korma_police: 4.50 } }

  it 'displays a menu' do
    expect { order.see_menu }.to output.to_stdout
  end

  it 'adds an item to the order' do
    order.add(:korma_police)
    expect(order.list).to include(:korma_police)
  end

  it 'raises an error if item not on menu' do
    expect { order.add(:pilau_talk) }.to raise_error 'item not on menu'
  end

end
