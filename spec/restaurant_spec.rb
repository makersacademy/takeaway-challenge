describe Restaurant do
  let (:menu_double) { double(:menu, dishes: 'menu dishes')}
  let (:menu_class_double) { double(:menu_class, new: menu_double) }
  let (:restaurant) { Restaurant.new() }
  
  it 'should display the dishes from the menu' do
    expect(restaurant.view_menu).to eq(menu_double.dishes)
  end
end