require "takeaway"

describe Takeaway do
  describe "#initialize" do
    it "has a menu with a length of 8" do
      expect(subject.menu).to eq({ "Chicken Curry" => 4, "Lamb Curry" => 4, "Vegetable Curry" => 3, "Keema" => 4, 
                                   "Mixed Grill" => 9, "Samosa" => 2, "Chicken Kebab" => 3, "Lamb Kebab" => 4 })
    end

    it "initially has an empty basket" do
      expect(subject.basket).to eq({})
    end
  end
end