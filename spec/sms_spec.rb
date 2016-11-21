require 'sms'
require "twilio-ruby"
describe SMS do
  subject(:sms) { described_class.new }

  let(:client) { double(:client, messages: messages) }
  let(:sms) { double(send_text: nil) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: 'AC1e23ec21dbfbe55dca0adb3687afdfe0',
      auth_token: '612c426da5038b7a02cc2e7786143f8d',
      from: "+441782454810",
      to:   "+447702602704",
      body: "Thank you! Your order will be delivered before %s"
    }
  end
  it "delivers an SMS with the time of delivery" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.send_text
  end
end
