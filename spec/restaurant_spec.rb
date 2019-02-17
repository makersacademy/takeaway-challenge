require './lib/restaurant.rb'

describe Restaurant do
  let(:menu_double) { double(:menu, display_menu: 'menu dishes') }
  let(:menu_class_double) { double(:menu_class, new: menu_double) }
  
  let(:order_double) { double(:order) }
  let(:order_class_double) { double(:order_class, new: order_double) }
  
  let(:messenger_double) { double(:messenger) }
  let(:messenger_class_double) { double(:messenger_class, new: messenger_double) }
  
  let(:dish_class_double) { double(:dish_class) }
  
  let(:restaurant) { 
    Restaurant.new(
      menu_class: menu_class_double, 
      order_class: order_class_double,
      messenger_class: messenger_class_double,
      dish_class: dish_class_double
    ) 
  }

  it 'should instantiate menu, passing it the dish class' do
    restaurant
    expect(menu_class_double).to have_received(:new).with(dish_class: dish_class_double)
  end

  it 'should display the dishes from the menu' do
    expect(restaurant.view_menu).to eq(menu_double.display_menu)
  end

  it 'should create a new order' do
    expect(restaurant.create_order).to eq(order_double)
  end

  it 'should, when creating a new order, pass it the menu and messenger' do
    restaurant.create_order

    expect(order_class_double).to have_received(:new).with(
      menu: menu_double, 
      messenger: messenger_double
    )
  end
end
