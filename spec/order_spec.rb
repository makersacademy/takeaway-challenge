require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  subject(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      chicken: 3,
      fries: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fries).and_return(true)

    allow(menu).to receive(:price).with(:chicken).and_return(3.00)
    allow(menu).to receive(:price).with(:fries).and_return(2.00)
  end

  it 'selects some dishes from the menu' do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it 'does not add items that are not on menu' do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 3) }.to raise_error "Fish is not on the menu"
  end

  it 'calculates the total order' do
    create_order
    total = 13.00
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:chicken, 3)
    order.add(:fries, 2)
  end
end
