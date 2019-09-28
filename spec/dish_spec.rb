# dish_spec.rb
require "dish"

describe Dish do
  let(:dish) { described_class.new("Pizza", 8.50) }

  describe "#name" do
    it "returns dish name" do
      expect(dish.name).to eq "Pizza"
    end
  end

  describe "#price" do
    it "returns dish price" do
      expect(dish.price).to eq 8.50
    end
  end

end
