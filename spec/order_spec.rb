require "order"

describe Order do
  let(:dish) { double(price: 150, available: true, name: "Samosa", get_formatted_price: "£1.50") }
  let(:takeaway) { double(can_order: true) }
  let(:order) { Order.new(takeaway) }
  before(:each) { order.add_to_order(dish, 1) }

  it { expect(order.takeaway).to eq takeaway }
  it { expect(order.order).to eq({dish => 1}) }

  it "#add_to_order adds the dish to the order array" do
    expect(order.order.include?(dish)).to eq true
  end

  it "#get_price returns the price of the items so far" do
    expect(order.get_price).to eq("£1.50")
  end

  context "#complete_order(number_of_items)" do
    let(:phone) { double(send_message: true) }
    it "checks the number of items is correct and returns a message if true" do
      expect{order.complete_order(1)}.to output(/Thank you! Your order was place and will be delivered before \d\d.\d\d\n/).to_stdout
    end
    it "executes phone.send_message if an instace of Phone is passed to it as a second argument" do
      expect(order.complete_order(1,phone)).to eq(true)
    end
  end

end
