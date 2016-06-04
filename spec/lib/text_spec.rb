require 'text'

describe Text do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do
    {
      account_sid: "123",
      auth_token: "23fds",
      from: "+123",
      to: "+234",
      body: "Thank you! Your order will be delivered before #{(Time.now+(60*60)).strftime('%r')}"
    }
  end

  it "delivers an SMS with the estimated time" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order will be delivered before #{(Time.now+(60*60)).strftime('%r')}"
    }
    sms.send_text
    expect(messages).to have_received(:create).with(args)
  end
end

