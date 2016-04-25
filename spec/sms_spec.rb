require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do
    { account_sid: "abc",
      auth_token: "abc123",
      from: "+12345",
      to: "+4412345",
      body: "Thank you! Your order was placed and will be delivered before %s"
    }
  end

  it 'delivers an sms with the estimated delivery time' do
    arguments = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    sms.send
    expect(messages).to have_received(:create).with(arguments)

  end
end
