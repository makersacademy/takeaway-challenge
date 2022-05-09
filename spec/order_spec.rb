require 'Order'
describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
    chicken: 2,
    veg: 3
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:veg).and_return(true)

    allow(menu).to receive(:price).with(:chicken).and_return(3.50)
    allow(menu).to receive(:price).with(:veg).and_return(2.75)
  end

  it "selects several dishes from the menu" do
    order.add(:chicken, 2)
    order.add(:veg, 3)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items not on the menu to be selected' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error "Beef is not on the menu!"
  end

  it 'calculates the total for the order' do
    order.add(:chicken, 2)
    order.add(:veg, 3)
    total = 15.25
    expect(order.total).to eq(total)
  end
end
