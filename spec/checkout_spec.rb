require "checkout"

describe Checkout do
subject(:checkout) { described_class.new }

  describe "#show_order" do
    it "should print the user's order" do
      expect(checkout).to receive(:show_order)
      checkout.show_order
    end
    it "should print the user's order" do
      expect(checkout).to receive(:print_order)
      checkout.show_order([{dish: "chicken", price: 5}])
    end
    it "should print the user's order" do
      expect(checkout).to receive(:calculate_total)
      checkout.show_order([{dish: "chicken", price: 5}])
    end
  end
end
