require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client)}

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: "123",
      auth_token:  "23fds",
      from: "123",
      to: "123",
      body: "Thanks for your order, it will be delivered before %s"
    }
  end

  it "delivers a text message with delivery time" do
    args = {
        from: config[:from],
        to: config[:to],
        body: "Thanks for your order, it will be delivered before 19:19"
    }
    allow(Time).to receive(:now).and_return(Time.parse("18:19"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
  end
end
