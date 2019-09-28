require "menu"

describe Menu do
  subject(:menu) {described_class.new}
  before do
    menu.add("Ribeye", 2000)
  end

  describe "#list" do
    it "returns a list of available dishes" do
      expect(menu.list).to eq "Ribeye (£20)\n"
    end
  end
  describe "#add" do
    it "adds a dish and price to the menu" do
      menu.add("Pizza", 1000)
      expect(menu.list).to eq "Ribeye (£20)\nPizza (£10)\n"
    end
  end
end
