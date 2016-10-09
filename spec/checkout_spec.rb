require 'checkout'

describe Checkout do

  subject(:checkout) {described_class.new}

  describe "#message" do
    it 'delivery in 1 hours time' do
      expect(checkout.message).to eq "Your order will be delivered before #{Time.now + 1}."
    end
  end

  describe "#start_order" do
    xit ''
  end

end
