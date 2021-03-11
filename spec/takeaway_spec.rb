require 'takeaway'

describe Takeaway do
  describe "initialization should" do
    it "produce a menu object" do
      expect(subject.menu).to be_a(Menu)
    end
    it "produce an array to hold active orders" do
      expect(subject.active_orders).to be_a(Array)
    end
    it "produce an array to hold historical/completed orders" do
      expect(subject.order_history).to be_a(Array)
    end
  end
end
