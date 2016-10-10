require 'checkout'
require 'menu'
require 'order'
require 'message'

describe Checkout do

  subject(:checkout) {described_class.new}


  describe "#message" do
    it 'delivery in 1 hours time' do
      expect(checkout.message).to eq "Your order will be delivered before #{Time.now + 1}."
    end
  end

  describe "#start_order" do
    it 'creates a new order' do
      expect(checkout.start_order).to be_an_instance_of(Order)
    end

  end

end
