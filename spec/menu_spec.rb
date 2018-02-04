require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "should have an items hash" do
      expect(menu.items).to be_a(Hash)
    end
    it "creates a new display object" do
      expect(menu.display).to eq Display.new
    end
    xit "creates an empty array for shopping cart" do
      expect(menu.shopping_cart). to eq []
    end
  end
end
