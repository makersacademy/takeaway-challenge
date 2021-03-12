require 'takeaway'

describe Takeaway do
  describe "initialization should" do
    it "initialize a menu object" do
      expect(subject.menu).to be_a(Menu)
    end
    it "initialize an array to hold active orders" do
      expect(subject.active_orders).to be_a(Array)
    end
    it "initialize an array to hold historical/completed orders" do
      expect(subject.order_history).to be_a(Array)
    end
  end

  describe "new_order" do
    it "should create a new order" do
      expect(subject.new_order).to be_a(Order)
    end
  end

  describe "interface_print" do
    it "outputs the interface to stdout" do
      expect { subject.interface_print }.to output.to_stdout
    end
  end
end
