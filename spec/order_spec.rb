require "order"

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:dishes) do
    {
      chicken: 2,
      falafel: 1,
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:falafel).and_return(true)

    allow(menu).to receive(:price).with(:chicken).and_return(3.00)
    allow(menu).to receive(:price).with(:falafel).and_return(2.50)
  end

  def create_order
    order.add(:chicken, 2)
    order.add(:falafel, 1)
  end

  it "selects dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesnt allow items to be added if they are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error "Beef not on the menu!"
  end

  it "calculated the order total" do
    create_order
    total = 8.50
    expect(order.total).to eq(total)
  end
end
