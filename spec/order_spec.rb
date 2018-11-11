require "order"
require "menu"

describe Order do

  subject(:order) { described_class.new(menu) }

  let(:dishes) { {chicken: 2, kebab: 1} }
  let(:menu) { instance_double("Menu") }

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:kebab).and_return(true)

    allow(menu).to receive(:price).with(:chicken).and_return(5.00)
    allow(menu).to receive(:price).with(:kebab).and_return(2.00)
  end

  it "Adds items multiple items to the order" do
    order.add(:chicken, 2)
    order.add(:kebab, 1)
    expect(order.dishes).to eq dishes
  end

  it "Doesn't allow items that are not on the menu to be added" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect{ order.add(:beef, 2) }.to raise_error "That isn't on the menu!"
  end

  it "Calculates the total for the order" do
    order.add(:chicken, 2)
    order.add(:kebab, 1)
    total = 12
    expect(order.total).to eq(total)
  end


end
