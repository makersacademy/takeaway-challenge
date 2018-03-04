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
  end

  it 'select several dishes from the menu' do
    order.add(:pizza, 2)
    order.add(:pasta, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items to be added that are not in the menu' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end
end
