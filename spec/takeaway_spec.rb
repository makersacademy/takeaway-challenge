require "takeaway"

describe Takeaway do
#has a read_menu
#has a basket
#can return a dynamic delivery message

  context "before order"
    it "reads a menu" do
      expect(subject.read_menu).not_to be_empty
    end

    it "starts with an empty basket" do
      expect(subject.basket).to be_empty
    end

  context "adds menu items"
  context "places an order"
end