require "restaurant"
require "menu"
describe Restaurant do

 let(:restaurant) { Restaurant.new }
 let(:menu) { Menu.new }

  context "on opening the program" do

    it "can load a menu" do
      restaurant.load_menu(menu)
      expect(restaurant.menu).to eq(menu)
    end

  end




end
