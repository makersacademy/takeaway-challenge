require "order"

describe Order do
  describe "#initialize" do
    it "initializes an empty order" do
      expect(subject.items).to eq []
    end
  end
end