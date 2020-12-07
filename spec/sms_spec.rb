require './lib/sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: "44321",
      auth_token: "qwe123",
      from: "1337",
      to: "251",
      body: "Thank you! Your order, your order will be delivered at %s"
    }
  end

  it "delivers a text message with the ETA" do
    messages_args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order, your order will be delivered at 05:10"
    }
    allow(Time).to receive(:now).and_return(Time.parse("04:10"))
    expect(messages).to receive(:create).with(messages_args)
    sms.send
  end

end