require "order"

describe Order do

  let(:order) { described_class.new(menu) }

  let (:menu) { double(:menu)}

  let(:dishes) do
    {
      chicken: 1,
      fish: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
    allow(menu).to receive(:has_dish?).with(:lamb).and_return(false)

    allow(menu).to receive(:price).with(:chicken).and_return(7)
    allow(menu).to receive(:price).with(:fish).and_return(5)

  end

  it "selects different dishes from menu with qty" do
    order.add(:chicken, 1)
    order.add(:fish, 2)
    expect(order.dishes).to eq(dishes)
  end

  it " raises error if item is not on the menu" do
    expect { order.add(:lamb, 1) }.to raise_error("Item is not on the menu")
  end

  it "calculates total of the order"do
    order.add(:chicken, 1)
    order.add(:fish, 2)
    total = 17
    expect(order.total).to eq(total)
  end
end
