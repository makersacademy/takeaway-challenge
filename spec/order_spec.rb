require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:dishes) do
    {
      burger: 3,
      falafel: 6
    }
  end
    before do
      allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
      allow(menu).to receive(:has_dish?).with(:falafel).and_return(true)
    end

  it ' selectes several dishes from the menu' do
    order.add(:burger, 3)
    order.add(:falafel, 6)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items to be added that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 3) }.to raise_error "Not on the menu"
  end
end
