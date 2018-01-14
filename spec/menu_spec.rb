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

end