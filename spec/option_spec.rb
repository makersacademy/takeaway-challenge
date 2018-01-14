require "option"

describe Option do

  subject(:option) { described_class.new }
  subject(:non_vegan_option) { described_class.new(food: "meat", price: 1000) }

  describe "#initialize" do
    it "should default to a price of 5" do
      expect(option.price).to eq 5		
	end

    it "should default to tofu" do
      expect(option.food).to eq "tofu"	
	end

	it "should be able to have a different price" do
      expect(non_vegan_option.price).to eq 1000
    end

	it "should be able to have a different food" do
      expect(non_vegan_option.food).to eq "meat"
	end

  end
end
