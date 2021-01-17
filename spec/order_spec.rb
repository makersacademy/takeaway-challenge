require "order"

describe Order do
  subject(:order) { described_class.new }

  let(:dishes) do
    { spring_roll: 0.99, 
    char_sui_bun: 3.99 }
  end
    
  it 'selects several dishes from menu' do
    order.add(:spring_roll, 0.99)
    order.add(:char_sui_bun, 3.99) 
    expect(order.dishes).to eq(dishes)
  end
end
