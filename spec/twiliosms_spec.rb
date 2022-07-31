require 'twiliosms'

describe TwilioSMS do

  let(:test_sid) { ENV["TWILIO_TEST_ACCOUNT_SID"] }
  let(:test_key) { ENV["TWILIO_TEST_AUTH_TOKEN"] }
  let(:test_mobile) { ENV["TWILIO_TEST_MOBILE"] }
  let(:twilio) { TwilioSMS.new(test_sid, test_key) }

  let(:time_plus_one) do
    time = Time.now.strftime("%H:%M")
    time_plus_one = Time.now.strftime("%H:%M").split(":")
    time_plus_one[0] = time_plus_one[0].to_i
    time_plus_one[0] += TwilioSMS::DELIVERY_TIME
    time_plus_one[0] = time_plus_one[0].to_s
    time_plus_one = time_plus_one.join(":")
  end

  it 'calculates current time + 1 hours' do
    expect(twilio.delivery_time).to eq time_plus_one
  end

  describe '#send_sms' do
    it 'send a text' do
      expect(twilio).to respond_to(:send_sms)
    end

    it 'contains a delivery time' do
      message = twilio.send_sms(test_mobile)
      expect(message.body).to eq "Thank you! Your order was placed and will be delivered before #{time_plus_one}"
    end
  end
end
