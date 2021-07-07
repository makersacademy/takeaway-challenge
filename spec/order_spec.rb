require 'order'

describe Order do
  subject(:order) { described_class.new }

#   let(:menu) { double(:menu) }
  let(:food) do 
    { cheesburger: 2,
        hamburger: 1,
        fanta: 3,
        fries: 3,
        sundae: 4
    }

    # allow(menu).to receive(:price).with(:cheesburger).and_return(0.99)
    # allow(menu).to receive(:price).with(:hamburger).and_return(0.89)
    # allow(menu).to receive(:price).with(:fanta).and_return(0.89)
    # allow(menu).to receive(:price).with(:fries).and_return(0.89)
    # allow(menu).to receive(:price).with(:sundae).and_return(0.99)


  end

  it 'adds selected dishes to the order' do
    order.add(:cheesburger, 2)
    order.add(:hamburger, 1)
    order.add(:fanta, 3)
    order.add(:fries, 3)
    order.add(:sundae, 4)
    expect(order.food).to eq(food)  
  end

  it 'calculates total' do
    order.add(:cheesburger, 2)
    order.add(:hamburger, 1)
    order.add(:fanta, 3)
    order.add(:fries, 3)
    order.add(:sundae, 4)
    total = 11.18
    expect(order.total).to eq(total)  

  end
    
end
