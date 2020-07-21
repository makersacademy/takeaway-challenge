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

  it 'creates instance of class' do
    expect(order).to be_a(Order)
  end

  it 'initializes with an empty order' do
    expect(order.dishes).to be_empty
  end
  
  it ' allows user to order several dishes from menu' do
    order.add(:rice, 2)
    order.add(:curry, 1)
    order.add(:fish, 2)
    expect(order.dishes).to eq(dishes)
  end

end
