require "menu"
require "restaurant"
describe Menu do

let(:the_menu) { Menu.new }

  context "once menu loaded" do
    # Test data - output of the expect operation is expected to match this test data
    let(:test_dishes){ {  "char sui buns" => 1.00, "taiwanese rice" => 5.00, "bibimbap" => 4.00 } }
    # Expect "dishes" to be a hash
    it "has dishes hash" do
      expect(the_menu.dishes).to be_a(Hash)
    end
    # Expect calling "dishes" on instance of menu to return "dishes"
    it "has a list of dishes" do
      expect(the_menu.dishes).to eq (test_dishes)
    end

  end

  context "can display dishes list" do
    # Expect menu instance to respond to method "display_menu"
    it "respond to display menu" do
      expect(the_menu).to respond_to(:display_menu)
    end
    # Expect calling "display_menu" on menu instance to return dishes hash printed
    it "displays dishes" do
      printed_dishes = "Char sui buns, Price 1.0", "Taiwanese rice, Price 5.0", "Bibimbap, Price 4.0"
      expect(the_menu.display_menu).to eq printed_dishes
    end

  end

end
