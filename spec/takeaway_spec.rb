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

  describe "order_entry" do
    it "will captures the customers order" do
      allow($stdin).to receive(:gets) { "1" }
      expect(subject.order_entry).to eq(1)
    end
  end

  describe "input_check" do
    it "when the input is a string return downcase of that string" do
      expect(subject.input_check("Word")).to eq("word")
    end
    it "when the input is a number in a string return the int of that number" do
      expect(subject.input_check("10")).to eq(10)
    end
  end
end
