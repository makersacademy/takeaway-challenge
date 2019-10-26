require 'menu'

describe Menu do
  subject(:menu) { Menu.new }
  dish = Dish.new('chicken tikka', '10.00', true)
  dish_2 = Dish.new('chicken korma', '14.00', true)
  dish_3 = Dish.new('chicken bhuna', '9.00', true)

  describe '#add_dish' do
    # TODO - replace dish with double
    it '1 dish to empty menu' do
      expect(menu.add_dish(dish)).to eq [dish]
    end

    it 'add multiple dishes to a menu' do
      menu.add_dish(dish)
      expect(menu.add_dish(dish_2)).to eq [dish, dish_2]
    end
  end

  describe '#print_contents' do
    it 'empty menu' do
      expect(menu.print_contents).to eq ''
    end

    it 'one dish' do
      menu.add_dish(dish)
      expect(menu.print_contents).to eq '1 chicken tikka £10.00'
    end

    it 'multiple available dishes' do
      pretty_menu = '1 chicken tikka £10.00, 2 chicken korma £14.00, 3 chicken bhuna £9.00'
      menu.add_dish(dish)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      expect(menu.print_contents).to eq pretty_menu
    end
  end
end
