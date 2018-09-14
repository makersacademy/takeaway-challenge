require 'dish'

describe Dish do
  describe "#price" do
    it "should have a price method with one argument" do
      expect(subject).to respond_to(:price).with(1).argument
    end

    it "should return the dish price" do
      expect(subject.price(10)).to eq(10)
    end
  end

  describe "#name" do
    it "should have a name method with one argument" do
      expect(subject).to respond_to(:name).with(1).argument
    end
  end

  describe "#add" do
    it "should have a add method with two arguments" do

    end

    it "have a method adding the dish to the menu" do
      expect(subject).to respond_to(:add).with(2).arguments
    end
  end
end
