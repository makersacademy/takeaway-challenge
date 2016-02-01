require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }
  let(:dishes) do
    {
      starter: 2,
      main:    4
    }
  end

  before do
    allow(menu).to receive(:price).with(:starter).and_return(4.95)
    allow(menu).to receive(:price).with(:main).and_return(8.65)
    allow(menu).to receive(:price).with(:dessert).and_return(5.35)
  end

  it 'selects several dishes from the menu' do
    order.add(:starter, 2)
    order.add(:main, 4)
    expect(order.dishes).to eq(dishes)
  end

  it 'calculates the total for the order' do
    order.add(:starter, 2)
    order.add(:main, 4)
    total = 27.20
    expect(order.total).to eq(total)
  end

end
