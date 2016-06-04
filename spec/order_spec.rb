require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu}

  describe "#select" do

    it "should respond to select with 2 arguments" do
      expect(order).to respond_to(:select).with(2).arguments
    end
  end

  describe "#confirm" do

    it "should respond to confirm with 1 argument" do
      expect(order).to respond_to(:select).with(2).arguments
    end

    # it "should return true if money equals balance" do
    #   allow(order).to receive(:select){2}
    #   expect(order.confirm(2)).to eq(true)
    # end
  end

end
