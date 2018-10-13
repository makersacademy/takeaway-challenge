require 'order'

describe Order do
  before {
    subject.add("Half Chicken", 2)
    subject.add("Chicken Wing", 5)
  }
  describe "#add" do
    it "should add several dishes to the current order" do
      expect(subject.current).to eq "Your current order:\n2 x Half Chicken\n5 x Chicken Wing"
    end
  end

  describe "#total" do
    it "should return the total cost of the order" do
      expect(subject.total).to eq 21
    end
  end
end
