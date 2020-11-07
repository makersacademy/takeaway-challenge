require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      hotdog: 2,
      fries: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:hotdog).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fries).and_return(true)
  end

  it "selects several dishes from the menu" do
    order.add(:hotdog, 2)
    order.add(:fries, 1)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:hamburger).and_return(false)
    expect { order.add(:hamburger, 2) }.to raise_error NoItemError, "Hamburger is not on the menu!"
  end


end
