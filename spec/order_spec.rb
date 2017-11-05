require 'order'
require 'twilio-ruby'

describe Order do
  context 'Sending a confirmation SMS of the order' do
    describe '#send_sms' do
      it "Should send an SMS to the user, and store that to a @message variable" do
        subject.send_confirmation
        expect(subject.text).to eq "Sent from your Twilio trial account - Thanks for your order! It will be delivered at #{subject.delivery_time}."
      end
    end
  end
end
