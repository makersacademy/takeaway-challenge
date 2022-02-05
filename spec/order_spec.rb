require_relative '../lib/order.rb'
require_relative '../lib/menu.rb'

describe Order do
  let(:dish) {double :dish}

  let(:dishes) do
    {
      Drink: 5,
      Small_fries: 4,
      Large_fries: 3,
      Chicken_burger: 2,
      Cheeseburger: 1
    }
  end

  it 'should start with an empty order' do
    expect(subject.dishes).to be_empty
  end

  it 'allows a user to select desired number of dishes from menu' do
    new_order
    expect(subject.dishes).to eq(dishes)
  end

  it 'should calculate the total price of an order' do
    expect(subject.total).to eq([])
  end

  def new_order
    subject.add(:Drink, 5)
    subject.add(:Small_fries, 4)
    subject.add(:Large_fries, 3)
    subject.add(:Chicken_burger, 2)
    subject.add(:Cheeseburger, 1)
  end
end

   