require_relative '../lib/takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  menu = Menu.new

  describe "#read_menu" do
    it "should return the menu" do
      expect(takeaway.read_menu).to eq(menu.items)
    end
  end

  describe "#order" do
    it "adds items to basket" do
      takeaway.order("Pepperoni Pizza")
      expect(takeaway.basket).to include("Pepperoni Pizza")
    end
  end

  describe "#basket_summary" do
    it "should return the basket items, quantities and price" do
      takeaway.order("Pepperoni Pizza", 2)
      takeaway.order("Coke", 2)
      expect(takeaway.basket_summary).to eq "Pepperoni Pizza x2 = £20, Coke x2 = £2"
    end
  end

  describe "#total" do
    it "should return the total of basket in £" do
      takeaway.order("Pepperoni Pizza", 2)
      takeaway.order("Coke", 1)
      expect(takeaway.total).to eq(21)
    end
  end
end