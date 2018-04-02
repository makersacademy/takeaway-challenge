require 'menu'

describe Menu do
  subject(:menu) { Menu.new }
  let(:dishes) { { "Margherita"=> 7.00, "Pepperoni"=> 7.50, "Ham & Pineapple"=> 7.50, "Vegetarian"=> 7.00, "Meat Feast"=> 8.00, "Chicken Supreme"=> 8.00, "Veggie Supreme"=> 8.00, "Ham & Mushroom"=> 7.25 } }

  describe '#readable_menu' do
    it 'shows the dishes available' do
      expect(menu.readable_menu).to eq(dishes)
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
