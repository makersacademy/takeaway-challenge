require 'dish'

describe Dish do

  let (:description) { "Battered cod" }
  let (:price) { "4.00" }
  let (:dish) { described_class.new(description,price) }

  describe "#description" do
    it "returns the description of a dish" do
      expect(dish.description).to eq description
    end
  end
end
