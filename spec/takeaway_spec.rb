require "takeaway.rb"

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:order1) { double :order }
  let(:order2) { double :order }

  before(:each) do
    allow(order1).to receive_message_chain(:order, :size).and_return(1)
    allow(order1).to receive_message_chain(:order, :each)
    allow(order2).to receive_message_chain(:order, :size).and_return(1)
    allow(order2).to receive_message_chain(:order, :each)
  end

  describe "#menu" do
    it { is_expected.to respond_to :menu }
  end

  describe "#take_order" do

    it { is_expected.to respond_to(:take_order).with(1).argument }
    
    it "take several orders" do
      takeaway.take_order(order1)
      takeaway.take_order(order2)
      expect(takeaway.orders).to eq [order1, order2]
    end

    it "should return message" do
      expect(takeaway.take_order(order1)).to be_kind_of(String)
    end
  end
end
