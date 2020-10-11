require 'restaurant'

describe Restaurant do
  describe "@menu" do
    it "stores a list of foods" do
      menu_double = double :menu
      restaurant = Restaurant.new(menu_double)
      expect(restaurant.menu).to eq menu_double
    end
  end
end
