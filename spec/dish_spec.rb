require 'dish'

describe Dish do
  subject(:dish) {described_class.new(:sushi, 5)}

    it "stores and returns the price" do
      expect(dish.price).to eq 5
    end

    it "knows its name" do
      expect(dish.name).to eq :sushi
    end

end