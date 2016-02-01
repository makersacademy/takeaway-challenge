require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }
  let(:dishes) do
    {
      starter: 2,
      main:    4
    }
  end

  it 'selects several dishes from the menu' do
    order.add(:starter, 2)
    order.add(:main, 4)
    expect(order.dishes).to eq(dishes)
  end

end
