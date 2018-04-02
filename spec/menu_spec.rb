require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  describe '#readable_menu' do
    it 'shows the dishes available' do
      readable_presentation = "Margherita pizza : £7.00, Pepperoni pizza : £7.50, Ham & Pineapple pizza : £7.50, Vegetarian pizza : £7.00, Meat Feast pizza : £8.00"
      expect(menu.readable_menu).to eq(readable_presentation)
    end
  end

  describe '#item_on_menu?' do
    it 'returns true when an item is on the menu' do
      expect(menu.item_on_menu?("Pepperoni")).to eq true
    end

    it 'returns false when an item is not on the menu' do
      expect(menu.item_on_menu?("Tuna")).to eq false
    end
  end
end
