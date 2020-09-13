require "dish"

describe Dish do
  let(:dish_double) { double :dish, name: "Crispy Tofu", price: 7.99 }
  let(:dish_class_double) { double :dish, new: dish_double(name, price) }

  it "checks that dish is created with two parameters" do
    expect(Dish).to respond_to(:new).with(2).arguments
  end

  describe "#initialize" do
    it "checks that name is equal to dish name" do
      tofu = Dish.new("Tofu", 7.99)
      expect(tofu.name).to eq "Tofu"
    end

    it "checks that name is equal to dish name" do
      tofu = Dish.new("Tofu", 7.99)
      expect(tofu.price).to eq 7.99
    end
  end
end
