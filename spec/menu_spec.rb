require "menu"

describe Menu do
  it "it has a list of dishes that can be seen (is not empty)" do
    expect(subject.dish.empty?).to be false
  end

  describe "#price" do
    it "it returns the price of a certain dish from the menu" do
      expect(subject.price("Cold Pizza")).to eq 7
    end
  end
end
