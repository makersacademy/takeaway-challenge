require 'sms'

describe SMS do
  subject(:sms) { described_class.new(client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages)}

  let(:config) do
    {
      account_sid: "ACe637fe96a3f1502069638a5a7a3e93e9",
      auth_token: "0048512d0918cf7c81026a7621312cc3",
      from: "+441359366023",
      to: "+447515151659",
      body: "Thank you! Your order will be delivered before %s"
    }
  end

    it "delivers an SMS with the estimated time" do
      pending("Test pending as Twilio not yet working")
      args = {
        from: config[:from],
        to: config[:to],
        body: "Thank you! Your order will be delivered before 18:52"
      }

      allow(Time).to receive(:now).and_return(Time.parse("17:52"))
      sms.deliver
      expect(messages).to have_received(:create).with(args)
    end
end
