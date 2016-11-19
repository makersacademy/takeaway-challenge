require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(order_class, sms)}

  let(:order_class){double :order_class, new: order }
  let(:order) {double :order, add_to_basket: 0,
    menu: {}, basket: {}, total: 0, checkout: 0 }
  let(:sms){ double :sms}

  it "should be able to display a menu" do
    expect{ takeaway.print_menu }.to output.to_stdout
  end

  it "should be able to display a basket" do
    expect{ takeaway.print_basket }.to output.to_stdout
  end

  it "should add to basket" do
    expect(order).to receive(:add_to_basket).with(:pizza, 1)
    takeaway.add_to_basket(:pizza, 1)
  end

  it "should checkout" do
    expect(order).to receive(:checkout).with(10)
    takeaway.checkout(10)
  end

end
