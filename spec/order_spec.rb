require 'order'
require 'menu'

describe Order do
subject(:order) { described_class.new(menu) }

let(:menu) { instance_double("Menu") }

let(:dishes) do
  {
    lamb: 2,
    chicken: 2
  }
end

before do
  allow(menu).to receive(:has_dish?).with(:lamb).and_return(true)
  allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)

  allow(menu).to receive(:price).with(:lamb).and_return(4.50)
  allow(menu).to receive(:price).with(:chicken).and_return(3.50)
end

  it "Selects dishes from the menu and adds to order" do
    order.add(:lamb, 2)
    order.add(:chicken, 2)
    expect(order.dishes).to eq(dishes)
  end

  it "Doesn't allow dishes that are not on the menu to the order" do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect{ order.add(:fish, 2) }.to raise_error "Fish is not on the Menu"
  end

  it "Calculates the total for the order" do
    order.add(:lamb, 2)
    order.add(:chicken, 2)
    total = 16.00
    expect(order.total).to eq(total)

  end
end
