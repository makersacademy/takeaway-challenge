require 'menu'
require 'dish'

describe Menu do

  before(:each) do
    Dish = double(Dish, :price => 10)
    subject.dish_add(Dish)
  end

  it 'Menu.menu should return an array' do
    expect(subject.menu).to be_instance_of(Array)
  end

  it 'Menu.menu should return dish list with prices' do
    expect { subject.menu }.to output(/Dish.*£#{Dish.price}/).to_stdout
  end
end
