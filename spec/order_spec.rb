require 'order'

describe Order do
  let(:basket) { double(:fake_basket, :calculate_total => 10) }
  let(:twilio) { double(:fake_twilio) }
  let(:time) { double(:fake_time) }
  let(:order) { Order.new(basket, time, twilio)}
  
  it "initializes an order with a basket" do
    expect(order.basket).to eq basket
  end
  #NOT PROPERLY TESTED - Is there a real reason to test this method??
  describe "#finalise_order" do # how can we test that properly???
    it "should return a string" do
      allow(order).to receive(:send_sms)
      allow(order).to receive(:create_receipt) { "" }
      expect(order.finalise_order).to be_a(String)
    end
  end

  describe "#to_s" do
    it "should return a string with order id and total" do
      expect(order.to_s).to eq "Order ID: 3 - Total: £10"
    end
  end
end
