require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client)}
  let(:client) { double :client, messages: messages }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: "123",
      auth_token: "lucy",
      from: "123",
      to: "234",
      body: "Thank you: Your order will be delivered before %s"
    }
  end

  it 'delevers an sms when the order is placed' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you: Your order will be delivered before 15:00"
      }
    allow(Time).to receive(:now).and_return("14:00")
    expect(messages).to receive(:create).with(args)
    sms.deliver

  end

end
