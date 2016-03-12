require 'menu'

describe Menu do

let(:dish_class) { double(:dish_class, new: dish) }
let(:dish) { double(:dish, :name => "name", price: "price", available: "available" ) }
#
subject(:menu) { described_class.new(dish_class: dish_class) }

NAME = "Chicken Curry"
PRICE = 12.30
NAME2 = "Fish Curry"
PRICE2 = 11.30
NAME3 = "Lamb curry"
PRICE3 = 14.30


  describe '1 #initialize' do
    it '1.0 contains an empty menu array' do
      expect(menu.dishes.empty?).to be true
    end
  end

  describe '2 #add_dish' do
    it '2.0 adds a dish to the dishes array' do
      menu.add_dish(NAME, PRICE)
      expect(menu.dishes.empty?).to be false
    end
  end



  describe '3 #show_menu' do
    it '3.0 shows a list of all available dishes' do
      allow(dish).to receive(:new).and_return(:name, :price)
      menu.add_dish(NAME2, PRICE2)
      allow(dish).to receive(:name).and_return("Chicken Curry")
      allow(dish).to receive(:price).and_return("12.30")

      expect(menu.show_menu).to be_a String
    end
  end


end
