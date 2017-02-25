require 'chinese'

describe Chinese, :c do
  subject(:chinese) { described_class.new }

  describe "#shows_dishes_with_prices" do
    test_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}

    it "holds a menu" do
      expect(chinese.restaurant_menu).to eq(test_menu)
    end

    it "prints the menu" do
      expect(chinese.print_menu(test_menu)).to eq(test_menu)
    end
  end
end
