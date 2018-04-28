require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "has got the full list of dishes on initialize" do
      expect(menu.list).to eq ({
        "Southern Chicken" => 5.50,
        "Chicken Katsu Curry" => 5.50,
        "Jerk Chicken" => 5.50,
        "Mamas Meatballs" => 5.30,
        "Kofta Patties" => 5.90,
        "Pasta Primavera" => 5.00,
        "Vegan Moussaka" => 5.20 })
    end
  end
end
