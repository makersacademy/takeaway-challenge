require 'text_confirm'
require 'pry'

describe TextConfirm do

  it 'sends a message' do
    account_sid = ENV['TWILIO_TEST_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TEST_AUTH_TOKEN']
    message = TextConfirm.new(account_sid, auth_token, '+15005550006')
    fixed = Time.new(2018, 10, 14, 17, 52, 00)
    allow(Time).to receive(:now).and_return(fixed)
    expect(message.send).to eq("Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 18:52")
  end

end
