require 'takeaway'
# let(:list_of_dishes) {double("Pasta: £3.50")} 

RSpec.describe Takeaway do

  describe "#menu" do
    it "should let me see the list of available dishes and their price" do
      expect(subject.menu).to eq(["Pasta: £3.50", "lasagna: £4.50", "water: £1.50"])
    end
  end

  describe "#select_dishes" do
    takeaway = Takeaway.new
    takeaway.order
    it "should let me select the dishes I want" do
      expect(takeaway.menu[1]).to eq ("lasagna: £4.50")
    end
  end

end
