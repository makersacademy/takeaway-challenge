require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do { margarita: 4, sandwich: 7 }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:margarita).and_return(true)
    allow(menu).to receive(:has_dish?).with(:sandwich).and_return(true)

    allow(menu).to receive(:price).with(:margarita).and_return(5.00)
    allow(menu).to receive(:price).with(:sandwich).and_return(2.99)
  end

  it "selects dishes from menu" do
    order.add(:margarita, 4)
    order.add(:sandwich, 7)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow random dishes that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:cheese).and_return(false)
    expect { order.add(:cheese, 2) }.to raise_error NoItemError, "Cheese WE DO NOT SELL THIS!!!"
  end

  it "figures out the toalt for the order" do
    order.add(:margarita, 4)
    order.add(:sandwich, 7)
    total = 40.93
    expect(order.total).to eq(total)
  end
end