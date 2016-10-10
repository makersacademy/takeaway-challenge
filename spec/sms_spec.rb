require 'sms'

describe SMS do
  subject(:sms) { described_class.new}

  let(:client) { double(:client, messages: messages) }
  let(:messages) {double(:messages)}

  let(:config) do
    {
      account_sid: "999",
      auth_token: "888",
      from: "+077",
      to: "+234",
      body: "Thank you! Your order has been submitted and will be delivered!"
    }
  end

  it "sends an sms with the estimation of time" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order has been submitted and will be delivered!"
    }

    expect(messages).to receive(:create).with(args)
    sms.deliver
  end
end
