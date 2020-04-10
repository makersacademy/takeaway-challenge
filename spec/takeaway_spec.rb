require "takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new }

  describe "#initialze" do
    it "creates an array called menu on initalize" do
      expect(takeaway.menu).to be_a(Hash)
    end
  end

  describe "#show_menu" do
    it "return a hash of food items and their price" do
      expect(takeaway.show_menu).to eq({ "Chicken Chow Mein" => 6.5, "Egg Fried Rice" => 4.8 })
    end
  end

  describe "#order" do

    it "should take user input for the item ordered and store it to a variable" do
      takeaway.order("Chicken Chow Mein")
      expect(takeaway.order_item).to eq("Chicken Chow Mein")
    end

    it "should take user input for the price of the order and store it to a variable" do
      takeaway.order("Chicken Chow Mein")
      expect(takeaway.order_price).to eq(6.5)
    end

    it "should raise an error if the item is not on the menu" do
      expect { takeaway.order("Chicken") }.to raise_error("no such item")
    end
  end

end
