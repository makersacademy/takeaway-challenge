require 'sms'

describe SMS do
  let(:amount) { double :amount }
  let(:client) { double(:client, account: account) }
  let(:account) { spy(:account, messages: messages) }
  let(:messages) { spy(:messages) }

  subject(:sms) { described_class.new(config, client) }

  let(:config) do
    {
      "ACCOUNT_SID" => "ACcd0591",
      "AUTH_TOKEN"  => "ccf501f",
      "FROM_PHONE"  => "+44776",
      "PHONE_NUMBER"=> "+44111"
    }
  end

  it 'creates an insatnce of a class' do
    expect(sms).to be_a(SMS)
  end

  describe '#send_sms' do
    it "delivers an SMS with the estimated time" do
      args = {
                from: config["FROM_PHONE"],
                to: config["PHONE_NUMBER"],
                body: "Thank you! Your order for the total amount of £#{amount} was placed and will be delivered before 18:52."
              }

      allow(Time).to receive(:hour).and_return(17)
      allow(Time).to receive(:min).and_return(52)
      sms.send_sms(amount)
      expect(messages).to have_received(:create).with(args)
    end
    it 'prints error if sms was not sent' do
      allow(sms).to receive(:prints_error_if_any)
      #expect { sms.send_sms }.to output.to_stdout
    end
  end

end
