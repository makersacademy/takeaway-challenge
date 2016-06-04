require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu}

  describe "#select" do
    it "should respond to select with 2 arguments" do
      expect(order).to respond_to(:select).with(2).arguments
    end
  end
end
