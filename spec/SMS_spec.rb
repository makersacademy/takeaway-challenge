require 'SMS'

describe SMS do 
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do 
    {
      account_sid: "123",
      auth_token: "34ftr",
      from: '+0000',
      to: '+77777',
      body: 'Cheers, your order will be delivered before %s'
    }
  end

  it "delivers an SMS with the estimated delivery time" do
    args = {
        from: config[:from],
        to: config[:to],
        body: 'Cheers, your order will be delivered before 20:00'
    }
    allow(Time).to receive(:now).and_return(Time.parse("19:00"))
    sms.deliver
    expect(messages).to have_received(:create).with(args)
  end
end
