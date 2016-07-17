require 'restaurant'
require 'menu'

describe Restaurant do

  context '#show_menu' do
    subject(:restaurant) { described_class.new }
    subject(:menu) { Menu.new}


    it 'should be able to show the customer a menu including prices' do
      expect(restaurant.show_menu).to eq (menu.display_meals)
    end

   describe "#order"
   it 'should allow a customer to order a number of items for the menu' do

   end
   
  end
end
