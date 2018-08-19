require 'takeaway'
require 'order'

describe Takeaway do
  
  describe "#display_menu" do
    it "should be able to access the menu" do
      expect(subject.display_menu).to be_a_kind_of(Hash)
    end
  end

  describe "#add_item" do
    it "should add item to basket" do
      subject.add_item("congee", 3)
      expect(subject.basket).to eq(["congee", "congee", "congee"])
    end
  end
end