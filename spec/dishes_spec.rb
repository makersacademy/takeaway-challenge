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
    it "raises an error if the amount of the dish requested is not available" do
      expect { dishes.available?(1, 11) }.to raise_error "Select a lower amount or a different dish please"
    end
  end
end
