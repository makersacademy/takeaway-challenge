require 'sms'

describe Sms do

  subject(:sms) { described_class.new(config, client: client) }
  let(:client)  {double :client}

  let(:config) do {
    account_sid: "AC218c1936150940433f01478c96b12a5d",
    auth_token: "c17f31b4d94d09659a8efc65fe3c6bea",
    from: "+441604420379",
    to: "+441604420379",
    body: "Thank you for placing your order! It will arrive before %s"
    }
  end

  it 'sends confirmation message with time' do

    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered before 17:00"
    }

    allow(Time).to receive(:now).and_return(Time.parse("16:00"))
    allow(client).to receive_message_chain(:account, :messages, :create).with(args)
    expect(sms).to receive(:send).and_return(client)
    sms.send

  end

end
