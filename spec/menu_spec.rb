require "menu"

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) do
    [
      { :name => "spring rolls", :price => 2 },
      { :name => "sour pork", :price => 5 },
      { :name => "vegetables noodles", :price => 4 },
      { :name => "shredded duck", :price => 7 },
      { :name => "dumplings", :price => 3 },
      { :name => "chop suey", :price => 4 }
    ]
  end

  describe "attributes" do

    it "shows dishes and prices" do
      expect(menu.dishes).to eq dishes

    end
  end
end
