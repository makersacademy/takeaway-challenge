require 'basket'
require 'dish'

describe Basket do

  before(:each) do
    Dish_1 = double(Dish, :price => 10)
    Dish_2 = double(Dish, :price => 15)
    subject.add_to_basket(Dish_1, Dish_2)
  end

  it 'Basket.add_to_basket(dish) should add dish' do
    expect(subject.basket).to include(Dish_1)
  end

  it 'Basket.total should return basket total' do
    expect(subject.total).to eq(Dish_1.price + Dish_2.price)
  end

end
