require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "has got the full list of dishes on initialize" do
      expect(menu.list).to eq({
        "southern chicken" => 5.59,
        "chicken curry" => 5.49,
        "jerk chicken" => 5.59,
        "mamas meatballs" => 5.39,
        "kofta patties" => 5.99,
        "pasta primavera" => 4.99,
        "vegan moussaka" => 5.29 })
    end
  end
end
