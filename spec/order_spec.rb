require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      raclette: 6,
      fondue: 15
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:raclette).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fondue).and_return(true)
  end

  it "selects several dishes from the menu" do
    order.add(:raclette, 6)
    order.add(:fondue, 15)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu"
  end
end
