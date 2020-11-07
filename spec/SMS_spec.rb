require 'SMS'

describe SMS do
  subject(:sms) { SMS.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
        account_sid: "23123",
        auth_token: "djfhskf",
        from: "3434",
        to: "2353",
        body: "Thank you! Your order will be delivered before %s"

    }
  end

  it 'delivers sms with ETA' do
    args = {
        from: config[:from],
        to: config[:to],
        body: "Thank you! Your order will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver_sms

  end

end