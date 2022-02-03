require_relative '../lib/sms'

describe SMS do

  let(:twilio_sms) { double(:twilio_sms, :send_sms => nil) }

  let(:from) { "2" }
  let(:to) { "1" }
  let(:sms_message) { "Thank you! Your order was placed and will be delivered before 18:52" }

  subject(:sms) { SMS.new(twilio_sms, from, to, sms_message) }

  it "has a to telephone number" do
    expect(sms.to).to eq "1"
  end

  it "has from telephone number" do
    expect(sms.from).to eq "2"
  end

  it "has a message" do
    expect(sms.message).to eq sms_message
  end

  it "sends an SMS message" do
    expect { sms.send }.not_to raise_error
  end

end
