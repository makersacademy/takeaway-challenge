require 'menu'

describe Menu do
  let(:dish) { double(:dish) }
  let(:dish_class) { double(:dish_class, new: dish) }
  it 'can have dishes added' do
    new_dish = dish_class.new('Foo, 2')
    subject.add_dish(dish)
    expect(subject.dishes).to include(dish)
  end
end
