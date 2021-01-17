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
  end

  it "selects several dishes from the menu" do
    order.add(:Pizza, 2)
    order.add(:Falafel, 1)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:Chicken).and_return(false)
    expect { order.add(:Chicken, 2) }.to raise_error NoItemError, "Chicken is not on the menu!"
  end

end