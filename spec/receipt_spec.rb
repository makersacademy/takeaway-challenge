require "receipt"

RSpec.describe Receipt do
  subject(:receipt) { described_class.new }

  describe "initialized class" do
    it { expect(Receipt).to respond_to(:new) }

    it "expects receipt class to be initialized with empty hash" do
      expect(receipt.order).to eq({})
    end
  end

  describe "#add_to_order" do
    it { expect(receipt).to respond_to(:add_to_order) }
  end

  describe "#print_order" do
    it { expect(receipt).to respond_to(:print_order) }
  end

  describe "#add_to_order" do
    it { expect(receipt).to respond_to(:print_total) }
  end
end
