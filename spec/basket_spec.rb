require 'basket'

describe Basket do
  describe "#initialize" do
    it "has an empty items array" do
      expect(subject.items).to be_empty
    end

    it "keeps a total that is 0 by default" do
      expect(subject.total).to eq 0
    end
  end
end
