require './lib/restaurant.rb'

describe Restaurant do
  let (:menu_double) { double(:menu, view_menu: 'menu dishes')}
  let (:menu_class_double) { double(:menu_class, new: menu_double) }
  let (:restaurant) { Restaurant.new(menu_class_double) }
  
  it 'should display the dishes from the menu' do
    expect(restaurant.view_menu).to eq(menu_double.view_menu)
  end
end