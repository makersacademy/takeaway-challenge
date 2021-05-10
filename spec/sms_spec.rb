require 'sms'
require 'takeaway'

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }
# implementing Twilio: https://rails.devcamp.com/trails/rest-microservices/campsites/sms-messages/guides/creating-a-rspec-stub-to-mimic-sending-sms-messages
  let(:config) do
    {
      account_sid: "123",
      auth_token: "26jmm",
      from: "+44123456789",
      to: "+44987654321",
      body: "Thank you! Your order was placed and will be delivered before %s"
    }
  end

  it 'delivers an SMS with the estimated time' do
    arguments = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(arguments)
    sms.deliver
  end
end
