require "send_sms"

describe SendSMS do
  subject(:send_sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  # client = Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
  let(:messages) { spy(:messages) }
  let(:config) do
    {
      account_sid: "AC4599064055b8d324b89925cd5942e372",
      auth_token: "86293f309beb51dc8b09da7e7d51d720",
      from: "+44 1133201183",
      to: "+44 7808275626",
      body: "Thank you! Your order will be delivered before %s"
    }
  end

  it "delivers an SMS with the estimated time" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order will be delivered before 18:52"
    }

    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    send_sms.deliver
    expect(messages).to have_received(:create).with(args)
  end
end
