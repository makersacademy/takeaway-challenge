require 'order'
require 'twilio-ruby'
require 'basket'
require 'menu'

describe Order do
  context 'Sending a confirmation SMS of the order' do
    describe '#send_sms' do
      it "Should send an SMS to the user, and store that to a @message variable" do
        subject.send_confirmation
        expect(subject.text).to eq "Sent from your Twilio trial account - Thanks for your order! It will be delivered at #{subject.delivery_time}."
      end
    end
  end
  context 'Emptying the user\'s basket once they have submitted their order' do
    describe '#empty_basket' do
      it "Should return the basket to being an empty array" do
        basket = Basket.new
        basket.add(1)
        basket.add(7)
        subject.reset_basket(basket)
        expect(basket.current_order).to eq []
      end
    end
  end
end
