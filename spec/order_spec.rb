require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu)}
  let(:dishes) do
    { rice: 2,
    somosa: 1}
  end
  before do
    allow(menu).to receive(:available_dish?).with(:rice).and_return true
    allow(menu).to receive(:available_dish?).with(:somosa).and_return true

    allow(menu).to receive(:price).with(:rice).and_return 2.00
    allow(menu).to receive(:price).with(:somosa).and_return 1.00
  end
  it 'selects dishes from the menu' do
    order.add(:rice, 2)
    order.add(:somosa, 1)
    expect(order.dishes).to eq(dishes)
  end
  it 'only allows you to select available dishes' do
    allow(menu).to receive(:available_dish?).with(:chicken).and_return false
    expect{ order.add(:chicken, 4) }.to raise_error "Chicken is not on the menu"
  end

  it 'works out the total for the order' do
    order.add(:rice, 2)
    order.add(:somosa, 1)
    total = 4
    expect(order.total).to eq(total)
  end
end
