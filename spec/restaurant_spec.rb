require 'restaurant'

describe Restaurant do

subject(:restaurant) { described_class.new(menu) }
let(:menu) { double(:menu, print_menu: "rice: £1")}

  context 'So a customer can place an order' do

    it 'has a menu containing dishes and price' do
      expect(restaurant.show_menu).to eq "rice: £1"
    end

    it 'allows single dishes to be placed' do
      restaurant.order_dish(dish: "chicken", quantity: 2)
      expect(restaurant.order).to eq({"chicken" => 2})
    end

    it 'allows multiple dishes to be selected' do
      restaurant.order_dish(dish: "noodles", quantity: 4)
      restaurant.order_dish(dish: "chicken",quantity: 2)
      expect(restaurant.order).to eq({"chicken" => 2, "noodles" => 4})
    end



  end
end
