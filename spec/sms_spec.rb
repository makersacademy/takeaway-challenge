require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages)}
  # later topic let(:messages) { spy(:messages)}
# making configuration hash
  let(:config) do
    {
      account_sid: "123",
      auth_token: "23fds",
      from: "+123",
      to: "+234",
      body: "Thank you! Your order will be delivered before %s"
    }
  end

  it "delivers an SMS with the estimated time" do
    args = {
      from: config[:from],
      to: config[:to],
      body:"Thank you! Your order will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
    # using spy instead of double allows expect in the end of the test here -- expect(messages).to have_received(:creat).with(args)--make our expectation more clear that where we want it
  end
end