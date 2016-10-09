require 'dish'

describe Dish do
  subject(:dish) {described_class.new("Cheese and tomato", 5.99)}
  describe "#initialize" do
    xit "initializes with name" do
      expect(dish.name).to eq "Cheese and tomato"
    end
    xit "initializes with a price" do
      expect(dish.price).to eq 5.99
    end
  end
end
