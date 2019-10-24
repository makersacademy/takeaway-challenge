require 'menu'
require 'dish'

describe Menu do
  subject { described_class.new }
  dish = Dish.new("Swedish Meatballs", 2.50) 
  it 'has an empty list of dishes' do
    expect(subject.dishes).to eq []
  end
  it 'has a method for adding a dish to the list of dishes' do
    expect(subject.add_dish(dish)).to eq [dish]
  end
end
