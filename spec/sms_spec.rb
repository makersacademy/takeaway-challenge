require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    { account_sid: "12345", auth_token: "aabbcc123",
      from: "+7700700800", to: "+77800123456",
      body: "Your order will be delivered before %s" }
  end

  it "sends an SMS with an estimated time" do
    info = {
      from: config[:from], to: config[:to],
      body: "Your order will be delivered before 12:45"
    }
    allow(Time).to receive(:now).and_return(Time.parse("11:45"))
    expect(messages).to receive(:create).with(info)
    sms.deliver
  end

end
