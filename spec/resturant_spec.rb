require 'restaurant'
require 'menu'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, dishes: menu_items) }
  let(:menu_items) { { "Pizza" => 5.48, "Lamb Donner Kebab" => 7.30, "Chicken Wings" => 7.63, "Garlic Bread" => 3.40 } }

  describe '#read_menu' do
    it 'Displays what is on the menu' do
      expect(restaurant.read_menu).to include menu_items
    end
  end
end
