require './lib/restaurant.rb'

describe Restaurant do
  let(:menu_double) { double(:menu, view_menu: 'menu dishes') }
  let(:menu_class_double) { double(:menu_class, new: menu_double) }
  
  let(:order_double) { double(:order) }
  let(:order_class_double) { double(:order_class, new: order_double) }
  
  let(:restaurant) { 
    Restaurant.new(
      menu_class: menu_class_double, 
      order_class: order_class_double
    ) 
  }

  it 'should display the dishes from the menu' do
    expect(restaurant.view_menu).to eq(menu_double.view_menu)
  end

  it 'should create a new order' do
    expect(restaurant.create_order).to eq(order_double)
  end
end
