require 'dish'

describe Dish do
  describe "#price" do
    it "Has dish hamburger with price of $6.00" do
      expect((Dish.burger).price).to eq 6.00
    end

    it "Has dish cheese burger with price of $7.00" do
      expect((Dish.cheeseburger).price).to eq 7.00
    end

    it "Has dish double cheeseburger with price of $9.00" do
      expect((Dish.doublecheese).price).to eq 9.00
    end

    it "Has dish hotdog with price of $5.00" do
      expect((Dish.hotdog).price).to eq 5.00
    end

    it "Has dish French Fries with price of $3.00" do
      expect((Dish.fries).price).to eq 3.00
    end
  end
end
