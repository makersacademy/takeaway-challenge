require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu")}

  let(:dishes) do
    {
      samosa: 4,
      naan: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:samosa).and_return(true)
    allow(menu).to receive(:has_dish?).with(:naan).and_return(true)

    allow(menu).to receive(:price).with(:samosa).and_return(6.50)
    allow(menu).to receive(:price).with(:naan).and_return(2.50)
  end

  it 'allows customer to select dishes from menu' do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items to be added that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:cow).and_return(false)
    expect {order.add(:cow, 1)}.to raise_error NoItemError, "Cow is not an option."
  end

  it 'calculates the order total' do
    create_order
    total = 31.00
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:samosa, 4)
    order.add(:naan, 2)
  end

end
