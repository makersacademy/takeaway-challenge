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
  end

  it 'selects some number of available dishes from the menu' do
    order.add(:burger, 3)
    order.add(:chicken, 2)
    expect(order.items).to eq(items)
  end

  it 'doesn\'t allow items that are unavailable to be added' do
    allow(menu).to receive(:has_item?).with(:fish).and_return(false)
    expect { order.add(:fish, 3) }.to raise_error("Fish is not on the menu!")

  end
end
