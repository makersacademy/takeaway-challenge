require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:dishes) do
    {
    pizza: 2,
    pasta: 1
    }
  end

  before do
    allow(menu).to receive(:available?).with(:pizza).and_return true
    allow(menu).to receive(:available?).with(:pasta).and_return true

  end
  it 'selects several dishes from menu' do
    order.add(:pizza, 2)
    order.add(:pasta, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items to be added that are not on the menu' do
    allow(menu).to receive(:available?).with(:chicken).and_return false
    expect { order.add(:chicken, 2) }.to raise_error("Chicken is not on the menu")
  end
end
