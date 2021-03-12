require 'restaurant'

describe Restaurant do
  let(:restaurant) { Restaurant.new }

  describe 'see_menu' do
    it 'displays a menu of one dish to the user' do
      # not sure if I should have used a double here
      # dish = double(name: "pizza", price: "5")
      # menu = double(menu: [dish])
      restaurant.design_dish("Pizza", "5")
      expect(restaurant.see_menu).to eq("Pizza: 5\n")
    end
    it 'displays a menu of two dishes to the user' do
      restaurant.design_dish("Pizza", "5")
      restaurant.design_dish("Pasta", "4")
      expect(restaurant.see_menu).to eq("Pizza: 5\nPasta: 4\n")
    end
  end
end
