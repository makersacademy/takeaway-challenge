require "menu"
require "dish"
require "order"

describe Order do
  let(:order) { Order.new }

  it "expects order to be initalised with a menu" do
    expect(Order).to respond_to(:new).with(1).argument
  end

  describe "#add" do
    it "expects order to respond to add method" do
      expect(order).to respond_to(:add).with(2).arguments
    end

    it do
    end
  end
end
