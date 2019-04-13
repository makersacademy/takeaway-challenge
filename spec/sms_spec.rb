require "sms"

describe SMS do
subject(:sms) { described_class.new(config, client: client) }

let(:client) { double(:client, messages: messages) }
let(:messages) { double(:messages) }

let(:config) do
  {
    account_sid: "123",
    auth_token: "23fds",
    from: "123",
    to: "+234",
    body: "Thank you! your order will be deliverd before %s"
  }
end

  it "delivers an sms to the customer with the time of delivery" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! your order will be deliverd before 18:52"
    }
  allow(Time).to receive(:now).and_return(Time.parse("18:50"))
  expect(messages).to receive(:create).with(args)
  sms.deliver
  end
end
