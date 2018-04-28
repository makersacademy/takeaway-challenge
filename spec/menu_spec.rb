require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "has got the full list of dishes on initialize" do
      expect(menu.list).to eq ({
        "southern chicken" => 5.50,
        "chicken curry" => 5.50,
        "jerk chicken" => 5.50,
        "mamas meatballs" => 5.30,
        "kofta patties" => 5.90,
        "pasta primavera" => 5.00,
        "vegan moussaka" => 5.20 })
    end
  end
end
