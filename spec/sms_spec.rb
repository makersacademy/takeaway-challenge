require "sms"

describe SMS do

  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do
    {
      account_sid: "123",
      auth_token: "23fds",
      from: "1234",
      to: "6789",
      body: "Thank you! Your order was placed and will be delivered before %s"
    }
  end

  it "delivers an SMS with the estimated time" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    sms.deliver
    expect(messages).to have_received(:create).with(args)
  end
end