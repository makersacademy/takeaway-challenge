require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:items) do
    {
      burger: 3,
      chicken: 2
    }
  end

  it 'selects some number of available dishes from the menu' do
    order.add(:burger, 3)
    order.add(:chicken, 2)
    expect(order.items).to eq(items)

  end
end
