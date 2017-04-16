require 'menu'

describe Menu, :c do
  subject(:menu) { described_class.new }

  describe "#shows_dishes_with_prices" do
    test_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
    printed_menu = test_menu.each_with_index do |(key, val), ind|
      "#{ind+1}: #{key} -- £#{val}"
    end

    it "holds a menu" do
      expect(menu.the_menu).to eq(test_menu)
    end

    it "prints a menu" do
      expect(menu.print_menu).to eq(printed_menu)
    end
  end
end
