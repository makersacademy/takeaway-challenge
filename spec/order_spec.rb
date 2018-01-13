require 'order'

describe Order do
  subject(:order) { described_class.new(menu)}
  let(:menu) { double :menu }
  let(:dishes) do
    {
      lobster: 1,
      shark: 1
    }
  end
  
  before do
    allow(menu).to receive(:price).with(:lobster).and_return(11092)
    allow(menu).to receive(:price).with(:shark).and_return(15423)

    allow(menu).to receive(:on_menu?).with(:lobster).and_return(true)
    allow(menu).to receive(:on_menu?).with(:shark).and_return(true)
  end

  it 'selects multiple dishes from the menu' do
    order.add_item(:lobster, 1)
    order.add_item(:shark, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'raises an error when dish not on menu' do
    allow(menu).to receive(:on_menu?).with(:chicken).and_return(false)
    expect { order.add_item(:chicken, 1) }.to raise_error 'This isnt on the menu'
  end

  it 'calaculates the total for an order' do
    order.add_item(:shark, 1)
    order.add_item(:lobster, 1)
    total = 26515
    expect(order.total).to eq (total)
  end

end
