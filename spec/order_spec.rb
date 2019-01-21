require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      starter: 2,
      main: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:starter).and_return true
    allow(menu).to receive(:has_dish?).with(:main).and_return true

    allow(menu).to receive(:price).with(:starter).and_return(1.75)
    allow(menu).to receive(:price).with(:main).and_return(5.00)
  end

  it "selects dishes from the menu" do
    dummy_order
    expect(order.dishes).to eq(dishes)
  end

  it 'doesnt allow non-existent dishes to be ordered' do
    allow(menu).to receive(:has_dish?).with(:wine).and_return false
    expect { order.add(:wine, 2) }.to raise_error "There is no wine"
  end

  it 'calculates the total for the order' do
    dummy_order
    total = 8.50
    expect(order.total).to eq(total)
  end

  def dummy_order
    order.add(:starter, 2)
    order.add(:main, 1)
  end
end
