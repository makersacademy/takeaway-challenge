require 'menu'
require 'dish'

describe Menu do
  it 'should hold an array of dishes' do
    dish = { name: "chicken", price: 20}
    expect(subject.add_dish(dish)).to eq [dish]
  end

  it 'should output a list' do
    dish = Dish.new("Salmon", 18)
    dish2 = Dish.new("steak", 24)
    subject.add_dish(dish)
    subject.add_dish(dish2)
    expect(subject.list_dishes).to eq [dish, dish2]
  end
end
