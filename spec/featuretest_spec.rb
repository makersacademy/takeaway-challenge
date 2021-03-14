require 'restaurant'
require 'menu'
require 'item'

describe Restaurant do
  it 'should be able to do what I wish' do
    pret = Restaurant.new
    pret.create_menu('Brekkie')
    pret.add_item_to_menu(0, 'Coffee', 2, 'Flat White')
    pret.print_restaurant_menu
  end
end
