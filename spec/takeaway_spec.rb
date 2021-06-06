require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:order1) { double :order }
  let(:order2) { double :order }

  context "#menu" do
    it { is_expected.to respond_to :menu }
  end

  context "#take_orders" do

    it { is_expected.to respond_to(:take_orders).with(1).argument }
    it "take orders" do
      takeaway.take_orders(order1)
      expect(takeaway.take_orders(order2)).to eq [order1, order2]
    end
  end
end
