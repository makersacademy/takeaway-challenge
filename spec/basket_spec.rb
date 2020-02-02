require 'basket'
require 'dish'

describe Basket do

  before(:each) do
    Dish_1 = double(Dish, :name => 'Dish_1', :price => 10)
    Dish_2 = double(Dish, :name => 'Dish_2', :price => 15)
    subject.add(Dish_1, Dish_2)
  end


  it 'Basket.total should return basket total' do
    expect(subject.total).to eq(Dish_1.price + Dish_2.price)
  end

  it 'Basket.view should print basket and total' do
    expect { subject.view }.to output {
      /#{Dish_1.name}.*#{Dish_1.price}
      #{Dish_2.name}.*#{Dish_2.price}
      #{subject.total}/
    }.to_stdout
  end

end
