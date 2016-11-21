require 'sms'

describe SMS do

  subject(:sms) { described_class.new(config, client: client) }
  let(:client)  {double :client}

  let(:config) do {
    account_sid: "123",
    auth_token: "jf48g",
    from: "+44123",
    to: "+234",
    body: "Thank you! Your order was placed and will be delivered before %s"
    }
  end

  it 'sends confirmation message with time' do

    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered before 17:20"
    }

    allow(Time).to receive(:now).and_return(Time.parse("16:20"))
    allow(client).to receive_message_chain(:account, :messages, :create).with(args)
    expect(sms).to receive(:send).and_return(client)
    sms.send

  end

end
