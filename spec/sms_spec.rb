require "sms"

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }
  let(:config) do
    {
      account_sid: "AC5710e41bf25cacd4f5ff746a81eea1b7",
      auth_token: "4eddb910ab7ad16afc8b0e9c7469e786",
      to: "+447414986478",
      from: "+441923750609",
      body: "thank you! Your order will be deliverd before %s"
    }
  end

  it "delivers and SMS with the estimated time" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "thank you! Your order will be deliverd before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    sms.deliver
    expect(messages).to have_received(:create).with(args)
  end
end
