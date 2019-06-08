require 'restaurant'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'Prints list of dishes with prices' do
    restaurant = Restaurant.new('cafe')
    restaurant.add_menu_item('Slice of Cake', 6)
    restaurant.add_menu_item('Ham Toastie', 8)
    expect(restaurant.view_menu).to eq "Slice of Cake - £6.00\nHam Toastie - £8.00"
  end
end
