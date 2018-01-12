require 'dish'

describe Dish do
  subject {described_class.new("Lamb Biryani", 4.99)}
  describe "#name" do
    it "returns the name of the dish" do
      expect(subject.name).to eq "Lamb Biryani"
    end
  end
    describe "#price" do
      it "returns the price of the dish" do
        expect(subject.price).to eq 4.99
      end
    end
    describe "#to_s" do
      it "returns the name and price as a string" do
        expect(subject.to_s).to eq "Lamb Biryani, £4.99"
      end
    end

end
