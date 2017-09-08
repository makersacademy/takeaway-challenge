require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) {  double(:menu) }

  let(:dishes) do
    {
      burger: 2,
      steak: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
    allow(menu).to receive(:has_dish?).with(:steak).and_return(true)

    allow(menu).to receive(:price).with(:burger).and_return(8.99)
    allow(menu).to receive(:price).with(:steak).and_return(14.99)
  end

  it "will select several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "will not allow dishes to be added, that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:lobster).and_return(false)
    expect { order.add(:lobster, 2) }.to raise_error NoItemError, "Sorry, Lobster is not on the menu."
  end

  it "can calculate the order total" do
    create_order
    total = 32.97
    expect(order.total).to eq (total)
  end

  def create_order
    order.add(:burger, 2)
    order.add(:steak, 1)
  end
end
