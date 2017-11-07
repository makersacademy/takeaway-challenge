require 'order'
require 'menu'

describe Order do
  let(:loaded_basket) do
    basket = Basket.new
    basket.add(1)
    basket.add(7)
    basket
  end
  context 'Placing an order' do
    describe '#place_order' do

      it "Should send an SMS to the user, and store that to a @message variable" do
        subject.place_order(loaded_basket)
        expect(subject.text).to eq "Sent from your Twilio trial account - Thanks for your order! It will be delivered before #{subject.delivery_time}."
      end

      it "Should return the basket to being an empty array" do
        allow(subject).to receive(:send_confirmation) { subject.text = "Sent from your Twilio trial account - Thanks for your order! It will be delivered before #{subject.delivery_time}." }
        subject.place_order(loaded_basket)
        expect(loaded_basket.current_order).to eq []
      end

    end
  end
end
