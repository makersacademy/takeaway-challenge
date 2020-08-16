require 'order'

describe Order do

  subject(:order) {described_class.new(menu)}
  let(:dishes) { {Burger: 1, Pizza: 1} }
  let(:menu) {double "menu"}

  before do
    allow(menu).to receive(:has_dish?).with(:Burger).and_return(true)
    allow(menu).to receive(:has_dish?).with(:Pizza).and_return(true)

    allow(menu).to receive(:price).with(:Burger).and_return(10.00)
    allow(menu).to receive(:price).with(:Pizza).and_return(12.50)
  end

  it 'adds dishes to the order' do
    order.add(:Burger, 1)
    order.add(:Pizza, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items to be ordered that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:chips).and_return(false)
    expect {order.add(:chips, 2)}.to raise_error "Chips is not available"
  end

  it 'calculates the total for the order' do
    order.add(:Burger, 1)
    order.add(:Pizza, 1)
    total = 22.50
    expect(order.total).to eq(total)
  end
end