require "menu"

describe Menu do
  describe "#main_menu method" do
    it "should return a menu items in array" do
      expect(subject.main_menu).to be_a(Array)
    end

    it "menu items should have prices" do
      expect(subject.main_menu.last).to be_a(Hash)
    end
  end
end
