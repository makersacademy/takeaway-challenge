require './lib/menu.rb'

describe Menu do
  let (:a_menu) {Menu.new}
#  let (:dish) {double :Dish.new}
  it 'can create a new instance of the Menu class' do
    expect(a_menu).to be_a(Menu)
  end
  it 'can display a list of dishes and their prices' do
    a_dish = Dish.new
    expect(a_menu.show_menu).to include "Sushi £10.00"
  end
end