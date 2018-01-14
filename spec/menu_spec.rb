require "menu"

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) do
    {
      "spring rolls" => 2,
      "sour pork" => 5,
      "vegetables noodles" => 4,
      "shredded duck" => 7,
      "dumplings" => 3,
      "chop suey" => 4
    }
  end

  describe "attributes" do

    it "shows dishes and prices" do
      expect(menu.dishes).to eq dishes

    end
  end
end
