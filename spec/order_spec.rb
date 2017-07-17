require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      pork: 2,
      prawns: 1
    }
  end
  before do
    allow(menu).to receive(:has_dish?).with(:pork).and_return(true)
    allow(menu).to receive(:has_dish?).with(:prawns).and_return(true)
  end
  it 'allows you to select several dishes from the menu' do
    order.add(:pork, 2)
    order.add(:prawns, 1)
    expect(order.dishes).to eq(dishes)
  end
  it 'raises an error for items that aren\'t available on the menu' do
    allow(menu).to receive(:has_dish?).with(:curry).and_return(false)
    expect { order.add(:curry, 2) }.to raise_error NoItemError, 'Curry is not available to order!'
  end
end
