require 'menu'
require 'dish'

describe Menu do
  subject { described_class.new }
  dish = Dish.new("Swedish Meatballs", 2.50) 
  it 'has a list of dishes' do
    expect(subject.dishes).not_to be_empty
  end
  it 'can add a dish to the list of dishes' do
    expect(subject.add_dish(dish)).to include(dish)
  end
  it 'returns the list of dishes' do
    expect(subject.dishes).to eq subject.dishes
  end
end
