require 'order'

describe Order do
  subject(:order) { described_class.new }

  let(:food) do 
    { cheesburger: 2,
        hamburger: 1,
        fanta: 3,
        fries: 3,
        sundae: 4
    }
  end

  it 'adds selected dishes to the order' do
    order.add(:cheesburger, 2)
    order.add(:hamburger, 1)
    order.add(:fanta, 3)
    order.add(:fries, 3)
    order.add(:sundae, 4)
    expect(order.food).to eq(food)
    
  end
    
end
