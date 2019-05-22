require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      burger: 1,
      pak_tod: 3
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
    allow(menu).to receive(:has_dish?).with(:pak_tod).and_return(true)

    allow(menu).to receive(:price).with(:burger).and_return(4.00)
    allow(menu).to receive(:price).with(:pak_tod).and_return(1.50)
  end

  it "selects several dishes from the menu" do
    order.add(:burger, 1)
    order.add(:pak_tod, 3)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end

  it "calculates the total for the order" do
    order.add(:burger, 1)
    order.add(:pak_tod, 3)
    total = 8.50
    expect(order.total).to eq(total)
  end



end