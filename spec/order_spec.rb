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
  end

  it "will select several dishes from the menu" do
    order.add(:burger, 2)
    order.add(:steak, 1)
    expect(order.dishes).to eq(dishes)
  end

  it "will not allow dishes to be added, that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:lobster).and_return(false)
    expect { order.add(:lobster, 2) }.to raise_error NoItemError, "Sorry, Lobster is not on the menu."
  end
end
