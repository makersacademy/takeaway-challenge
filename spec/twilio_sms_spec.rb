require 'twilio_sms'
require 'dish'
require 'order'
require 'calculate_order'

describe TwilioSMS do

  let(:dish_1) { { :name => "sushi festival", :price => 3 } }
  let(:dish_2) { { :name => "chicken teriyaki dragon roll", :price => 4 } }

  describe '#initialize' do

    it 'should not by default send a SMS' do
      expect(subject.sms_sent).to eq false
    end

  end

  describe '#send_sms' do

    it 'should send a SMS if the order is complete' do
      subject.send_sms
      expect(subject.sms_sent).to eq true
    end

  end

end
