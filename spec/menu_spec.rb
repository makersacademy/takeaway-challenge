require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  describe '#add_dish' do

    dish = Dish.new('chicken tikka', '10.00', 'main')
    it '1 dish to empty menu' do
      expect(menu.add_dish(dish)).to eq [dish]
    end
  end
end
