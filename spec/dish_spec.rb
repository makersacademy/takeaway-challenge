require 'dish'

describe Dish do
  describe "#price" do
    subject { described_class.new("Large Chips", 4.39) }
    it "returns the price in pounds" do
      expect(subject.price).to eq(4.39)
    end
  end

end