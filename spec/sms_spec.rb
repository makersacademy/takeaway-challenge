require "sms"

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  # spy will allow expectation to be the last line in the test
  let(:messages) { spy(:messages) }

  let(:config) do
    {
      account_sid: ENV["AUTH_SID"],
      auth_token: ENV["AUTH_TOKEN"],
      from: ENV["TWILIO_NO"],
      to: ENV["CUSTOMER_NO"],
      body: "Thank you! Your order will be deliver before %s"
    }
  end

  it "delivers an SMS with the estimated time till delivery" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order will be deliver before 12:21"
    }
      # we can allow the class time to receive now in return
      allow(Time).to receive(:now).and_return(Time.parse("11:21"))
      sms.deliver
      # have_received) is used when spy is implemented
      expect(messages).to have_received(:create).with(args)
  end
end
