require './lib/sms.rb'

describe SMS do
  subject(:sms) { described_class.new }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: "123",
      auth_token: "23fds",
      from: "345",
      to: "456",
      body: "Thanks. Your order delivery time before %s"
    }
  end

  it 'delivers sms with a time' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thanks. Your order delivery time before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    sms.delivered
    expect(messages).to receive(:create).with(args)
  end

end
