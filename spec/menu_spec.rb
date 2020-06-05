require 'menu'

RSpec.describe Menu do 
  describe '.dishes' do
    it 'can respond to the items method' do
      menu = Menu.new
      expect(menu).respond_to?(:dishes)
    end

    it 'can return a list of dishes' do
      menu = Menu.new
      dish = double(:Dish, name: 'Cheeseburger')
      menu.add_dish(dish)
      dish2 = double(:Dish, name: 'Hamburger')
      menu.add_dish(dish2)
      expect(menu.dishes).to include(dish)
      expect(menu.dishes).to include(dish2)
    end
  end

  describe '.add_item' do
    it 'can add a dish object to the dishes array' do
      menu = Menu.new
      dish = double(:Dish, name: 'Cheeseburger')
      menu.add_dish(dish)
      expect(menu.dishes).to include(dish)
    end
  end
end