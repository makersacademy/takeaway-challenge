require 'dish'

RSpec.describe Dish do

  context "constructs" do
    it "dish" do
      dish = Dish.new("pizza", 12.00)
      expect(dish.dish).to eq "pizza"
    end

    it "price" do
      dish = Dish.new("pizza", 12.00)
      expect(dish.price).to eq 12.00
    end
  end

  context "formats dish" do
    it "for a receipt" do
      dish = Dish.new("pizza", 12.00)
      expect(dish.format).to eq "pizza, £12.00"
    end
  end

  context "when asking if dish is selected" do 
    it "returns true if selected" do
      dish = Dish.new("pizza", 12.00)
      dish.selected
      expect(dish.is_selected?).to eq true
    end

    it "returns false if not selected" do
      dish = Dish.new("pizza", 12.00)
      expect(dish.is_selected?).to eq false
    end

    it "returns false if dish is deselected" do
      dish = Dish.new("pizza", 12.00)
      dish.selected
      expect(dish.deselect).to eq false
    end
  end

end
