require "checkout"

describe Checkout do
subject(:checkout) { described_class.new }

  describe "#show_order" do
  # let(:order) { double('order', selection_of_dish: 'chicken', 2 ) }
  # allow(:order).to receive(:selection_of_dish 'chicken', 2)
    it "should print the user's order" do
      expect(checkout).to receive(show_order)
    end
  end
end
