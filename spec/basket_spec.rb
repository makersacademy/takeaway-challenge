require 'basket'
require 'dish'

describe Basket do

  before(:each) do
    Dish = double(Dish, :price => 10)
    subject.add_to_basket(Dish)
  end

  it 'Order.add_to_basket(dish) should add dish' do
    expect(subject.basket).to include(Dish)
  end

end
