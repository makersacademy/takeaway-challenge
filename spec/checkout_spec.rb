require 'menu'
require 'pretty_format'
require 'checkout'

describe Checkout do
  let(:order) { double("order", :basket => {[:"Tempura Mixed Vegetables"]=>3, [:"Spicy Prawn Cracker"]=>3}, :total => 20.4) }
  let(:sms) { double("sms", :gets => "\n") }
  subject { Checkout.new(order.basket, order.total) }
  it 'receives the order details when initialized' do
    expect(Checkout).to respond_to(:new).with(6).arguments
  end
  it 'requests details to send confirmation text message' do
    # expect(subject.confirmation).to eq "\n"
  end
end
