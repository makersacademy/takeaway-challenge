require "menu"

describe Menu do
  describe "#list" do
    it "returns a list of available dishes" do
      menu = Menu.new
      expect { menu.list }.not_to raise_error
    end
  end
end
