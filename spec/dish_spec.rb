require "dish"

describe Dish do
  context "#initialize" do
    it "should have a name" do
      expect(subject.name).to eq subject.name
    end
    it "should have a price" do
      expect(subject.price).to eq subject.price
    end
  end
end
