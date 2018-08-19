require "order"

describe Order do
  let(:subject) { described_class.new("John", 12345, "Sweet and sour chicken - 3, Black bean pork - 1, total - 4") }
  let(:sub2) { described_class.new("John", 12345, "Sweet and sour chicken - 3, Black bean pork - 1, total - 3") }
  describe "dishes" do
    it "returns the dishes ordered" do
      out = { "sweet and sour chicken" => 3, "black bean pork" => 1 }
      expect(subject.dishes).to eq out
    end
  end
  describe "#count" do
    it "returns the number of items in the order" do
      expect(subject.count).to eq 4
    end
  end
  describe "#total" do
    it "returns the total number of items as specified in the order" do
      expect(subject.total).to eq 4
    end
  end
end
