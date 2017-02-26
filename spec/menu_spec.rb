require 'menu'

describe Menu, :c do
  subject(:menu) { described_class.new }

  describe "#shows_dishes_with_prices" do
    test_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}

    it "holds a menu" do
      expect(menu.restaurant_menu).to eq(test_menu)
    end
  end
end
