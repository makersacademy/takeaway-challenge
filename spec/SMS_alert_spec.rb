require 'SMS_alert'

describe SMS do
  subject(:sms){ described_class }

  let(:twilio) { double :twilio, new: client }
  let(:client) { double :twilio_clinet, messages: message}
  let(:message){ double :twilio_message, create: nil}
  it{ is_expected.to respond_to(:send_message) }

  it "should return a time one hour from now" do
    one_hour_from_now = (Time.new + 3600).asctime[11,5]
    expect(sms.delivery_time).to eq one_hour_from_now
  end

  it "should send a message to my phone" do
    expect(message).to receive(:create).with(any_args)
    sms.send_message(twilio)
  end
end
