require "menu"

describe Menu do

  subject(:menu) { described_class.new }

  describe "attributes" do

    it "shows dishes and prices" do
      expect(menu.dishes).to eq [{ :name => "spring roll", :price => 2 }]
    end
  end
end
