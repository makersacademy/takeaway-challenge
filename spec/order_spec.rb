require 'order'

describe Order do
  subject(:order) { described_class.new }

  let(:dishes) do
    {
      eggs: 5,
      milk: 6
    }
  end

  it 'chooses couple of dishes from menu' do
    order.add(:eggs, 5)
    order.add(:milk, 6)
    expect(order.dishes).to eq(dishes)
  end
end
