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

    allow(menu).to receive(:price).with(:feijoada).and_return(6.50)
    allow(menu).to receive(:price).with(:coxinha).and_return(1.15)
  end

  it "selects several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end

  it "calculate the total of the order" do 
    create_order
    total = 14.95
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:feijoada, 1)
    order.add(:coxinha, 2)
  end
end