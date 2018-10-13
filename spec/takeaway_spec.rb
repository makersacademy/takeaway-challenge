require 'takeaway'
require 'pry'
describe Takeaway do
  describe "#menu" do
    it "should display a list of dishes with prices" do
      expect(subject.menu).to eq "Quarter Chicken: £4\nHalf Chicken: £8\nWhole Chicken: £13\nChicken Wing: £1"
    end
  end

  describe "#add_to_order" do
    it "should add the dish and quantity to the current order" do
      subject.add_to_order(["Half Chicken"], [2])
      expect(subject.current_order).to eq "Your current order:\n2 x Half Chicken"
    end

    it "should add several dishes to the current order" do
      subject.add_to_order(["Half Chicken", "Chicken Wing"], [2, 5])
      expect(subject.current_order).to eq "Your current order:\n2 x Half Chicken\n5 x Chicken Wing"
    end
  end
end
