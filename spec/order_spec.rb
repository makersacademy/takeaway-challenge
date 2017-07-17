require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      pork: 2,
      prawns: 1
    }
  end
  before do
    check_for_dish
    check_for_price
  end
  it 'allows you to select several dishes from the menu' do
    create_order
    expect(order.dishes).to eq(dishes)
  end
  it 'raises an error for items that aren\'t available on the menu' do
    allow(menu).to receive(:has_dish?).with(:curry).and_return(false)
    expect { order.add(:curry, 2) }.to raise_error NoItemError, 'Curry is not available to order!'
  end
  it 'calculates order total' do
    create_order
    total = 15.99
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:pork, 2)
    order.add(:prawns, 1)
  end

  def check_for_dish
    allow(menu).to receive(:has_dish?).with(:pork).and_return(true)
    allow(menu).to receive(:has_dish?).with(:prawns).and_return(true)
  end

  def check_for_price
    allow(menu).to receive(:price).with(:pork).and_return(5.75)
    allow(menu).to receive(:price).with(:prawns).and_return(4.49)
  end
end
