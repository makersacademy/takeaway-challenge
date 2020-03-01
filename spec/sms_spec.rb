require "sms"

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    { account_sid: "123", auth_token: "2345fs", from: "345", to: "678", body: "Thank you! Your order was placed and will be delivered before %s" } 
  end

  it "sends an sms with the delivery time" do
    args = { 
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
  end
end