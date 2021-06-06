require "chinese.rb"

describe Chinese do
  subject(:takeaway) { described_class.new }
  let(:order1) { double :order }
  let(:order2) { double :order }

  it { is_expected.to respond_to :menu }

  it "show a list of dishes with prices(Float)" do
    price = nil
    (takeaway.menu).each_value { |value| price = value }
    expect(price).to be_kind_of(Float)
  end

  describe "check the inheritance from Takeaway class" do

    context "#take_orders" do

      it { is_expected.to respond_to(:take_orders).with(1).argument }
      
      it "take orders" do
        takeaway.take_orders(order1)
        expect(takeaway.take_orders(order2)).to eq [order1, order2]
      end
    end
  end
end
