require "menu_item"

describe MenuItem do
  describe "#to_s" do
    it "returns a string representing the item" do
      pizza = MenuItem.new("Pizza", 10)
      expect(pizza.to_s).to eq("Pizza - £10.00")
    end
  end

  describe "#name" do
    it "returns the name" do
      pizza = MenuItem.new("Pizza", 10)
      expect(pizza.name).to eq("Pizza")
    end
  end

  describe "#price" do
    it "returns the price" do
      pizza = MenuItem.new("Pizza", 10)
      expect(pizza.price).to eq(10)
    end
  end
end
