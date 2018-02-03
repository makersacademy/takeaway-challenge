require "order"

describe Order do

  subject(:order) { described_class.new }

  context "when ordering one type of dish" do
    describe "#dish_quantity" do
      it "returns price of dish multiplied by given quantity in items array" do
        expect(order.dish_quantity("rice", 3)).to eq [3]
      end
    end
  end

  context "when ordering more than one type of dish" do
    describe "#dish_quantity" do
      it "returns price of dishes multiplied by given quantity in items array" do
        order.dish_quantity("szechuan tofu", 2)
        expect(order.dish_quantity("rice", 3)).to eq [10, 3]
      end
    end
  end

  describe "#calculate_total" do
    it "calculates total cost of prices in total array" do
      order.dish_quantity("szechuan tofu", 2)
      order.dish_quantity("rice", 3)
      expect(order.calculate_total).to eq 13
    end
  end
end
