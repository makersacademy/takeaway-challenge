require 'menu'

describe Menu do

  #@items = { "spring rolls":1.99, "chow mein":3.99, "egg fried rice":2.99,
  #  "sweet and sour chicken":4.99, "beef in black bean sauce":4.99 }

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
