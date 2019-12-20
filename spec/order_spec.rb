require 'order.rb'

describe Order do
  let(:order) { Order.new }
  let(:dishes) do
    {
      rice: 2,
      curry: 1,
      fish: 2
    }
  end
  it ' allows user to order several dishes from menu' do
    order.add(:rice, 2)
    order.add(:curry, 1)
    order.add(:fish, 2)
    expect(order.dishes).to eq(dishes)
  end

end
