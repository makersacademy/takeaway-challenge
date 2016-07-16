require 'restaurant'


describe 'User Stories' do

  subject(:restaurant) { Restaurant.new(menu) }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  let(:menu) { double(:menu, print_menu: "rice: £1")}


  context 'So a customer can place an order' do

    it 'has a menu with dishes and price' do
      expect(restaurant.show_menu).to eq "rice: £1"
    end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

    it 'allows single dishes to be selected' do
      restaurant.order_dish(dish: "chicken",quantity: 2)
      expect(restaurant.order).to eq({"chicken" => 2})
    end

    it 'allows multiple dishes to be selected' do
      restaurant.order_dish(dish: "noodles", quantity: 4)
      restaurant.order_dish(dish: "chicken",quantity: 2)
      expect(restaurant.order).to eq({"chicken" => 2, "noodles" => 4})
    end
  end

end
