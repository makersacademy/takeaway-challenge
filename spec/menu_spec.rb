require "menu"
require "restaurant"
describe Menu do

let(:menu) { Menu.new }

  context "once menu loaded" do

    let(:dishes){ {  "char siu buns" => 2.00, "taiwanese rice" => 5.00 } }

    it "has dishes hash" do
      expect(menu.dishes).to be_a(Hash)
    end

    it "has a list of dishes" do
      expect(menu.dishes).to eq (dishes)
    end

    it "respond to display menu" do
      expect(menu).to respond_to(:display_menu)
    end

    it "displays dishes" do
      expect(menu.display_menu).to eq dishes
    end



  end





end
