require "takeaway"

describe Takeaway do

  describe "#initialze" do
    it "creates an array called menu on initalize" do
      expect(subject.menu).to be_a(Hash)
    end
  end

  describe "#show_menu" do
    it "return a hash of food items and their price" do
      expect(subject.show_menu).to eq({"Chicken Chow Mein"=>6.5, "Egg Fried Rice"=>4.8}) # It's returning a hash I dont know why??
    end
  end

  # describe "#order" do
  #   it ""
  # end

end
