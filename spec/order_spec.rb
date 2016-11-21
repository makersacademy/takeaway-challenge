require 'order'
require 'menu'
describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double('Menu') }

  let(:dishes) do
    {
    hawaiian: 2,
    margherita: 1
    }
end

before do
  allow(menu).to receive(:has_dish?).with(:hawaiian).and_return(true)
  allow(menu).to receive(:has_dish?).with(:margherita).and_return(true)

  allow(menu).to receive(:price).with(:hawaiian).and_return(9.99)
  allow(menu).to receive(:price).with(:margherita).and_return(7.99)
end

  it 'selects several dishes from the menu' do
    order_start
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added if they dont exist on the menu" do
    allow(menu).to receive(:has_dish?).with(:burger).and_return(false)
    expect { order.add(:burger, 1) }.to raise_error("burger not on the menu!")
  end

  it 'should show the total of an order' do
    order_start
    total = 27.97
    expect(order.total).to eq(total)
 end

def order_start
  order.add(:hawaiian, 2)
  order.add(:margherita, 1)
end
end
