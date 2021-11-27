require 'dishes'

describe Dishes do
  let(:dishes) { Dishes.new }

  describe "#initailize" do
    context "creates a list of dishes with prices" do
      it "checks the dish name of the first dish" do
        expect(dishes.dishes[0][:name]).to eq "Mushroom Risotto"
      end
      it "checks the price of the second dish" do
        expect(dishes.dishes[1][:price]).to eq 4
      end
    end
  end

  describe "#available?" do
    it "returns true if 2 portions of fries are available" do
      expect(dishes.available?(5, 2)).to eq true
    end
  end
end
