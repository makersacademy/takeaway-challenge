require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  subject(:menu) { double(:menu) }

  let(:dishes) do
    {
      chicken: 3,
      fries: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fries).and_return(true)
  end

  it 'selects some dishes from the menu' do
    order.add(:chicken, 3)
    order.add(:fries, 2)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not add items that are not on menu' do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 3) }.to raise_error "Fish is not on the menu"
  end
end
