require "menu"

describe Menu do
  describe "#initialize method" do
    it "should initialize with a main menu" do
      expect(subject.main_menu).to be_a(Array)
    end

    it "set menu should have prices" do
      expect(subject.main_menu.last).to be_a(Hash)
    end
  end
end
