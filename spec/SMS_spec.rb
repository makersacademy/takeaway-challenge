require "sms"

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do
    {
      account_sid: "",
      auth_token: "",
      from: "+123",
      to: "+456",
      body: "Thank you! Your order will be delivered before %s"
    }
  end

  it 'delivers an SMS with the delivery time' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order will be delivered before 18:52"
    }

    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    sms.deliver
    expect(messages).to have_received(:create).with(args)
  end
end
