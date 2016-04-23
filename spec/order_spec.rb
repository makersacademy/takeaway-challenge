require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      pizza: 7,
      burger: 5
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)

    allow(menu).to receive(:price).with(:pizza).and_return(7.00)
    allow(menu).to receive(:price).with(:burger).and_return(5.00)
  end

  it "should select several dishes from menu" do
    order.add(:pizza, 7)
    order.add(:burger, 5)
    expect(order.dishes).to eq(dishes)
  end

  it "does not allow items not on menu to be added" do
    allow(menu).to receive(:has_dish?).with(:sandwich).and_return(false)
    expect { order.add(:sandwich, 2) }.to raise_error "Sandwich is not on the menu!"
  end

  it "calculates the order total" do
    order.add(:pizza, 7)
    order.add(:burger, 5)
    total = 74.00
    expect(order.total).to eq(total)
  end
end
