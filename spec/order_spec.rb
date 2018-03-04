require 'order'
describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:dishes) do
    {
       pizza: 2,
       pasta: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:pasta).and_return(true)
    allow(menu).to receive(:price).with(:pizza).and_return(4.50)
    allow(menu).to receive(:price).with(:pasta).and_return(4.30)
  end

  it 'select several dishes from the menu' do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items to be added that are not in the menu' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end

  it 'calculates the total for the order' do
    create_order
    total = 13.30
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:pizza, 2)
    order.add(:pasta, 1)
  end
end
