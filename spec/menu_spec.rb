require 'menu'
require 'dish'

describe Menu do
  subject { described_class.new }
  it 'has a list of dishes' do
    expect(subject.dishes).not_to be_empty
  end
  it 'can add a dish to the list of dishes' do
    dish =  instance_double('dish', name: "Swedish Meatballs", price: 2.50)
    expect(subject.add_dish(dish)).to include(dish)
  end
  it 'returns the list of dishes' do
    expect(subject.dishes).to eq subject.dishes
  end
  it 'has a method for selecting a menu item' do
    expect(subject.select_item(1)).to eq subject.dishes[0]
  end
end
