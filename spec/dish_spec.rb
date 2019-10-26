require './lib/menu.rb'

describe Dish do
  let (:a_dish) {Dish.new}
  let (:a_meal) {Menu.new}
  it 'can create a new instance of the Dish class' do
    expect(a_dish).to be_a(Dish)
  end
  
  it 'can store a list of dishes' do
    a_dish.dishes {is_expected.to include(:name, :price)}
  end
end