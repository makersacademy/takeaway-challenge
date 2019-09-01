require "dish"

describe Dish do
  context "When initialized" do
    dish = Dish.new(1, "Roast Chicken", 10, 12.50)
    it "dish identifier is set" do
      expect(dish.identifier).to eq(1)
    end
    it "dish description is set" do
      expect(dish.description).to eq("Roast Chicken")
    end
    it "dish available_quantity is set" do
      expect(dish.available_quantity).to eq(10)
    end
    it "dish cost is set" do
      expect(dish.cost).to eq(12.50)
    end
    it "outputs details for menu" do
      expect(dish.describe).to eq("1: Roast Chicken - £12.50")
    end
    describe "updating quantity" do
      it "reduces qty by 1 when one is ordered" do
        expect { dish.order(1) }.to change { dish.available_quantity }.by(-1)
      end
      it "raise if not enough available to cover order " do
        expect { dish.order(100) }.to raise_error("Not enough to fullfil order")
      end
    end
  end
  context "When no food available" do
    subject = described_class.new("dish1", "Roast Chicken", 0, 12.50)
    it "food available = false" do
      expect(subject).not_to be_available
    end
  end

  context "When food available" do
    subject = described_class.new("dish1", "Roast Chicken", 1, 12.50)
    it "food available = true" do
      expect(subject).to be_available
    end
  end
end
