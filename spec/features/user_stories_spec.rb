require 'restaurant'
require 'menu'
require 'text'

describe 'User Stories' do

  let(:menu) {Menu.new}
  let(:restaurant) {Restaurant.new}

  it 'Displays the menu' do
    expect(restaurant.display_menu).to eq menu.menu_list
  end

  it 'allows a user to add items' do
    restaurant.add_item("Bread")
    expect(restaurant.order).to include({"Bread" => 1})
  end

  it 'allows a user to add multiple items' do
    restaurant.add_item("Chicken Tagine", 4)
    expect(restaurant.order).to include({"Chicken Tagine" => 4})
  end

  it 'allows a user to see an order summary' do
    restaurant.add_item("Bread", 2)
    restaurant.add_item("Chicken Tagine", 4)
    expect(restaurant.order_summary).to eq ('2 x Bread = £1.00, 4 x Chicken Tagine = £20.00')
  end

  it 'allows a user to see an order total' do
    restaurant.add_item("Bread", 2)
    restaurant.add_item("Chicken Tagine", 4)
    expect(restaurant.order_total).to eq ('Order Total: £21.00')
  end

end
