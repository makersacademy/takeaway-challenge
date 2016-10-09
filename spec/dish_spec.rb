require 'dish'

describe Dish do
  subject { described_class.new("Pizza con spaghetti", 5) }

  describe "#name" do
    it "should know the name of the dish" do
      expect(subject.name).to eq("Pizza con spaghetti")
    end
  end

  describe "#price" do
    it "should know the price of the dish" do
      expect(subject.price).to eq(5)
    end
  end
end
