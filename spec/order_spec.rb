require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      steak: 10,
      chicken: 5
    }
  end

  it 'selects several dishes from menu' do
    order.add(:chicken, 5)
    order.add(:steak, 10)
    expect(order.dishes).to eq(dishes)
  end
end