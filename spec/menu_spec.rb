require './lib/menu.rb'

describe Menu do

  it "has a hash of dishes" do
    expect(subject.dish).to be_a(Hash)
  end

  describe "#price" do
    it "returns the price of a dish" do

      expect(subject.price("Tofu salad")).to eq(2.5)
    end
  end
end
