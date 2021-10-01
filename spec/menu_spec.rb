require "./lib/menu"

describe Menu do
  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "has a predefined menu" do
      expect(menu.menu).to eq ({
                                "pad thai" => 10.50,
                                "tofu katsu curry" => 11.00,
                                "chow mein" => 8.00,
                                "yakisoba" => 7.50,
                                "spring rolls" => 6.50,
                              })
    end
  end
end
