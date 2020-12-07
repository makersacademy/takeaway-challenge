require './lib/order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu")}
  let(:dishes) do
    {
      chicken: 2,
      chips: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return true
    allow(menu).to receive(:has_dish?).with(:chips).and_return true

    allow(menu).to receive(:price).with(:chips).and_return 1.00
    allow(menu).to receive(:price).with(:chicken).and_return 2.00
  end

  it 'chooses dishes from the menu' do
    order.add(:chicken, 2)
    order.add(:chips, 1)
    expect(order.dishes).to eq(dishes)
  end
  
  it "doesn't let items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:rice).and_return false
    expect { order.add(:rice, 2) }.to raise_error "Rice is not on the menu."
  end

  it "sums total of order" do
    order.add(:chicken, 4)
    order.add(:chips, 1)
    total = 9.00
    expect(order.total).to eq total
  end
  
end
