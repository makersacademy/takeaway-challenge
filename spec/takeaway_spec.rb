require_relative "../lib/takeaway.rb"

describe Takeaway do
  describe "#printer" do
    before do
      @takeaway = Takeaway.new()
    end

    it "should return a menu of food and their prices when menu is called" do
      expect(@takeaway.menu).to(eq("Burger : £3\nChips : £1\nKebab : £5\n"))
    end
  end

  describe "#addBasket" do
    before do
      @takeaway = Takeaway.new()
    end
    it "should add a food item to the basket" do
      @takeaway.addBasket("Burger")
      @takeaway.addBasket("Chips")
      expect(@takeaway.viewBasket).to(eq("Burger : £3\nChips : £1\n"))
    end
  end
end
