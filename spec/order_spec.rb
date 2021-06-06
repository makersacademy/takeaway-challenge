require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      feijoada: 1,
      coxinha: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:feijoada).and_return(true)
    allow(menu).to receive(:has_dish?).with(:coxinha).and_return(true)
  end

  it "selects several dishes from the menu" do
    order.add(:feijoada,1)
    order.add(:coxinha, 2)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end
end