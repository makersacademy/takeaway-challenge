require 'order'
require 'twilio-ruby'
require 'basket'
require 'menu'

describe Order do
  context 'Placing an order' do
    describe '#place_order' do
      xit "Should send an SMS to the user, and store that to a @message variable" do
        subject.place_order(Basket.new)
        expect(subject.text).to eq "Sent from your Twilio trial account - Thanks for your order! It will be delivered at #{subject.delivery_time}."
      end
      it "Should return the basket to being an empty array" do
        allow(subject).to receive(:send_confirmation) { subject.text = "Sent from your Twilio trial account - Thanks for your order! It will be delivered at #{subject.delivery_time}." }
        subject.place_order(Basket.new)
        basket = Basket.new
        basket.add(1)
        basket.add(7)
        subject.place_order(basket)
        expect(basket.current_order).to eq []
      end
    end
  end
end
