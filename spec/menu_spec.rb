require 'menu'

describe Menu do

  describe "#view" do
    it "returns @items" do
      expect(subject.view).to eq subject.items
    end
  end

  describe "#price" do
    it { is_expected.to respond_to(:price).with(1).argument }

    it "returns price when given an argument" do
      expect(subject.price("spring rolls")).to eq 1.99
    end
  end

end
