require 'sms'
require "twilio-ruby"
require '.env'
describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: ACCOUNT_SID,
      auth_token: AUTH_TOKEN,
      from: "+441782454810",
      to:   "+44702602704",
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
    sms.deliver
  end
end
