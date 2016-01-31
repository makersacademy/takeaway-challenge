require 'restaurant'
require 'menu'
require 'text'

describe 'User Stories' do

  let(:menu) {Menu.new}
  let(:restaurant) {Restaurant.new}

  before do
    restaurant.add_item("Bread", 2)
    restaurant.add_item("Chicken Tagine", 4)
  end

  it 'Displays the menu' do
    expect(restaurant.display_menu).to eq menu.menu_list
  end

  it 'allows a user to add items' do
    restaurant.add_item("Bread")
    expect(restaurant.order).to include "Bread" => 1
  end

  it 'allows a user to add multiple items' do
    expect(restaurant.order).to include "Chicken Tagine" => 4
  end

  it 'raises an error when an item is not on the menu' do
    expect{restaurant.add_item("Cheese")}.to raise_error 'No such item on the menu'
  end

  it 'allows a user to see an order summary' do
    expect(restaurant.order_summary).to eq '2 x Bread = £1.00, 4 x Chicken Tagine = £20.00'
  end

  it 'allows a customer to remove items' do
    restaurant.remove_item("Bread")
    expect(restaurant.order_summary).to eq('4 x Chicken Tagine = £20.00')
  end

  it 'raises an error when an item is not in the order' do
    expect{restaurant.remove_item("Cheese")}.to raise_error 'No such item in your order'
  end

  it 'allows a user to see an order total' do
    expect(restaurant.order_total).to eq 'Order Total: £21.00'
  end

  it 'raises an error if the wrong payment amount is submitted' do
    expect{restaurant.place_order(7.00)}.to raise_error 'Wrong payment amount'
  end

end
