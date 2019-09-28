require "menu"

describe Menu do
  subject(:menu) { described_class.new }
  before do
    menu.add("Ribeye", 2000)
    menu.add("Lobster", 3000)
  end

  describe "#list" do
    it "returns a list of available dishes" do
      expect { menu.list }.to output("Ribeye (£20)\nLobster (£30)\n").to_stdout
    end
  end
  describe "#add" do
    it "adds a dish and price to the menu" do
      menu.add("Pizza", 1000)
      expect { menu.list }.to output("Ribeye (£20)\nLobster (£30)\nPizza (£10)\n").to_stdout
    end
  end


end
