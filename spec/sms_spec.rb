require 'sms'

describe Sms do
  subject(:sms) { described_class.new(config, client: client) }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }
  let(:config) do {
      account_sid: "123",
      auth_token: "23fds",
      from: "+123",
      to: "+234",
      body: "Thank you! You order will be delivered before %s"
  }
  end
  it "delivers an SMS with an estimated time" do
    args = { from: config[:from], 
        to: config[:to], 
        body: "Thank you! You order will be delivered before 20:02"
    }
    allow(Time).to receive(:now).and_return(Time.parse("19:02"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
  end

end
