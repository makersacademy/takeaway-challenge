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

end
