require 'dish'

describe Dish do
  let(:p_pizza) {described_class.new("Pepperoni Pizza", 9.50)}
  describe "#name" do
    it "returns the dish name" do
      expect(p_pizza.name).to eq "Pepperoni Pizza"
    end
  end

  describe "#price" do
    it "returns the price of the dish" do
      expect(p_pizza.price).to eq 9.50
    end
  end
end
