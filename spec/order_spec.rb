require "order"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      noodles: 2,
      squid: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:noodles).and_return(true)
    allow(menu).to receive(:has_dish?).with(:squid).and_return(true)

    allow(menu).to receive(:price).with(:noodles).and_return(4.00)
    allow(menu).to receive(:price).with(:squid).and_return(5.60)
  end

  it "selects several dishes from the menu" do
    order.add(:noodles, 2)
    order.add(:squid, 1)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items not on the menu to be ordered" do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(false)
    expect { order.add(:chicken, 2) }.to raise_error "Chicken is not on the menu!"
  end

  it "caculates the total for the order" do
    order.add(:noodles, 2)
    order.add(:squid, 1)
    total = 13.60
    expect(order.total).to eq(total)
  end
end