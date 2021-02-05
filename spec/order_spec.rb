require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }


  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    { Pizza: 2, Falafel: 1 }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:Pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:Falafel).and_return(true)

    allow(menu).to receive(:price).with(:Pizza).and_return(19.50)
    allow(menu).to receive(:price).with(:Falafel).and_return(9.00)
  end

  it "selects several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:Chicken).and_return(false)
    expect { order.add(:Chicken, 2) }.to raise_error NoItemError, "Chicken is not on the menu!"
  end

  it "calculates the total for the order" do
    create_order
    total = 48.00
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:Pizza, 2)
    order.add(:Falafel, 1)
  end

end