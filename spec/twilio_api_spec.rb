require 'twilio_api'

describe 'send_sms' do
  before do
    allow(TwilioAPI).to receive(:send_sms).and_return("Thanks! Your order was placed & will be delivered within the hour.")
  end

  it 'sends a payment confirmation text' do
    TwilioAPI.send_sms
  end
end
