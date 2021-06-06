require "chinese.rb"

describe Chinese do
  subject(:takeaway) { described_class.new }
  let(:order1) { double :order1 }
  let(:order2) { double :order2 }

  before(:each) do
    allow(order1).to receive_message_chain(:order, :size).and_return(1)
    allow(order1).to receive_message_chain(:order, :each)
    allow(order2).to receive_message_chain(:order, :size).and_return(1)
    allow(order2).to receive_message_chain(:order, :each)
  end

  it { is_expected.to respond_to :menu }

  it "show a list of dishes with prices(Float)" do
    price = nil
    (takeaway.menu).each_value { |value| price = value }
    expect(price).to be_kind_of(Float)
  end

  describe "check the inheritance from Takeaway class" do

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
