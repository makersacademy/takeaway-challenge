require "dishes"

describe Dish do
  let(:subject) { described_class.new("Sweet and sour chicken", 10) }
  describe "#name" do
    it "returns the name of the dish" do
      expect(subject.name).to eq "Sweet and sour chicken"
    end
  end

  describe "#price" do
    it "returns the price of the dish" do
      expect(subject.price).to eq 10
    end
  end
end
