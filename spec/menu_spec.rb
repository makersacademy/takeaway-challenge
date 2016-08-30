
require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  context '#display_meals' do
    it 'displays the dishes and prices of the menu' do
      expect(menu.display_meals).to include('Pasta £4.50, Curry £3.70, Burger £2.80')
    end
  end
end
