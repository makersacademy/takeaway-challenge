require 'order'
describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu)}
  let(:dishes) do
    { rice: 2,
    somosa: 1}
  end
  before do
    allow(menu).to receive(:has_dish?).with(:rice).and_return true
    allow(menu).to receive(:has_dish?).with(:somosa).and_return true
  end
  it 'selects dishes from the menu' do
    order.add(:rice, 2)
    order.add(:somosa, 1)
    expect(order.dishes).to eq(dishes)
  end
  it 'only allows you to select available dishes' do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return false
    expect{order.add(:chicken, 4)}.to raise_error "Chicken is not on the menu"
  end
end
