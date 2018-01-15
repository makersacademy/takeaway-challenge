require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "#to_s" do
    it "returns menu as string" do
      expect(menu.to_s).to be_a String
    end
  end

  describe "#price" do
    it "gets price for item supplied as argument" do
      expect(menu.price("Spring rolls")).to eq 5.50
    end
  end

  describe "#contains?" do
    it "returns true if dish is on menu" do
      expect(menu.contains?("Spring rolls")).to eq true
    end
    it "returns false if dish is not on menu" do
      expect(menu.contains?("Not food")).to eq false
    end
  end


end