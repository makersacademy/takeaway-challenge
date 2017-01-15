require 'sms'

describe SMS do
  subject(:sms) {described_class.new(config, client: client)}

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: "sdas123213dsadq2e",
      auth_token: "1232dddsf1",
      from: "+123",
      to: "+234",
      body: "Thank you! Your order will be with you by %s"
    }
  end

  it 'Delivers an SMS with the estimated time of delivery' do
      args = {
        from: config[:from],
        to: config[:to],
        body: "Thank you! Your order will be with you by 18:52"
      }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver

  end

end
