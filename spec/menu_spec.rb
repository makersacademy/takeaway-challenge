require "menu"

describe Menu do

  describe "#upload" do
    it "should upload an external menu" do
      menu = {"skinny fries" => 2.95, "onion rings" => 3.5}
      subject.upload(menu)
      expect(subject.display).to eq menu
    end
  end

  describe "#add" do
    it "should add a new item to menu" do
      subject.add("onion rings", 3.5)
      expect(subject.display).to include("onion rings" => 3.5)
    end
  end

  describe "#remove" do
    it "should remove an item from menu" do
      subject.add("onion rings", 3.5)
      subject.remove("onion rings")
      expect(subject.display).not_to include("onion rings" => 3.5)
    end
  end
end
