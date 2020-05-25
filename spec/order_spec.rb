require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }
  
  let(:menu) { instance_double("Menu") }
  let(:dishes) do
    {
      breadsticks: 2,
      fish: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:breadsticks).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
  end

  it "selects some dishes" do
    order.add(:breadsticks, 2)
    order.add(:fish, 1)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow to add item that is not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu"
  end

end
