require "order"

describe Order do
  let(:dish) { double(price: 150, available: true) }
  let(:takeaway) { double(can_order: true) }
  let(:order) { Order.new }
  before(:each) { order.add_to_order(dish) }
  it "#add_to_order adds the dish to the order array" do
    expect(order.order.include?(dish)).to eq true
  end

  it "#get_price returns the price of the items so far" do
    expect{order.get_price}.to output("£1.50\n").to_stdout
  end
  context "#complete_order(number_of_items)" do
    it "checks the number of items is correct and returns a message if true" do
      expect{order.complete_order(1)}.to output(/Thank you! Your order was place and will be delivered before \d\d.\d\d\n/).to_stdout
    end
  end
end
