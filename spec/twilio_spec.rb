require 'twilio.rb'

describe TwilioSend do

  it "should use Twilio to send a text message" do
    expect(subject).to respond_to(:sms).with(1).argument
  end

  it 'should provide comfirmation message' do
      time = (Time.now + 3600).strftime("%H:%M")
      expect(subject.message).to eq(
      "Thank you! Your order was placed and will be delivered before #{time}.")
    end

end
