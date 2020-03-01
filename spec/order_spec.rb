require "order"
require "menu"
describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      spaghetti_lobster: 2,
      salmon_tartare: 1,
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:spaghetti_lobster).and_return(true)
    allow(menu).to receive(:has_dish?).with(:salmon_tartare).and_return(true)

    allow(menu).to receive(:price).with(:spaghetti_lobster).and_return(30.00)
    allow(menu).to receive(:price).with(:salmon_tartare).and_return(15.50)
  end

  it "selects several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end

  it "calculates the total for the order" do
    create_order
    total = 75.50
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:spaghetti_lobster, 2)
    order.add(:salmon_tartare, 1)
  end
end
