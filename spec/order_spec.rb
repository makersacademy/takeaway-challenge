require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  let(:items) do
    {
      burger: 3,
      chicken: 2
    }
  end

  before do
    allow(menu).to receive(:has_item?).with(:burger).and_return(true)
    allow(menu).to receive(:has_item?).with(:chicken).and_return(true)

    allow(menu).to receive(:price).with(:burger).and_return(2.00)
    allow(menu).to receive(:price).with(:chicken).and_return(2.00)
  end

  it 'selects some number of available dishes from the menu' do
    place_order
    expect(order.items).to eq(items)
  end

  it 'doesn\'t allow items that are unavailable to be added' do
    allow(menu).to receive(:has_item?).with(:fish).and_return(false)
    expect { order.add(:fish, 3) }.to raise_error("Fish is not on the menu!")
  end

  it 'calculates the order total' do
    place_order
    total = 10.00
    expect(order.total).to eq(total)
  end

  def place_order
    order.add(:burger, 3)
    order.add(:chicken, 2)
  end
end
