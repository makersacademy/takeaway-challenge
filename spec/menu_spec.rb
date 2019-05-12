require 'menu'

describe Menu do

  let(:menu) { Menu.new }
  let(:dish) { "burrito" }
  let(:notdish) { "burger" }

  describe "#show" do
    it "should show a dish with a price" do
      expect(menu.view).to eq(menu::dishes)
    end
  end

  describe "#available?" do
    it "should return true if the dish is on the menu" do
      expect(menu.available?(dish)).to eq(true)
    end
    it "should return false if the dish is not on the menu" do
      expect(menu.available?(notdish)).to eq(false)
    end
  end
end
