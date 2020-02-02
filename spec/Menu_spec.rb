require 'menu'
require 'dish'

describe Menu do

  before(:each) do
    Dish = double(Dish, :price => 10)
    subject.dish_add(Dish)
  end

  it 'Menu.menu should return dish list with prices' do
    expect { subject.menu }.to output(/Dish.*£#{Dish.price}/).to_stdout
  end
end
