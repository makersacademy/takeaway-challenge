require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      lasagne: 4,
      risotto: 3
    }
  end

before do
  allow(menu).to receive(:in_menu?).with(:lasagne).and_return(true)
  allow(menu).to receive(:in_menu?).with(:risotto).and_return(true)
  allow(menu).to receive(:price).with(:lasagne).and_return(4.5)
  allow(menu).to receive(:price).with(:risotto).and_return(3.5)
end

  it "returns select several dishes from the menu" do
    order.add(:lasagne, 4)
    order.add(:risotto, 3)
    expect(order.dishes).to eq(dishes)
  end

  it "returns an error when dishes not on the menu are called" do
    allow(menu).to receive(:in_menu?).with(:paella).and_return(false)
    expect { order.add(:paella, 3) }.to raise_error "PAELLA is not on the menu!!"
  end

  it "returns the total calculation of the order" do
    order.add(:lasagne, 4)
    order.add(:risotto, 3)
    total = 28.5
    expect(order.total).to eq(total)
  end
end
