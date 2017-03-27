require 'sms'

describe SMS do

  subject(:sms) { described_class.new(config, client: client) }
  let(:client) { double(:client, messages: messages)}
  let(:messages) { spy(:messages) }

  let(:config) do {
      account_sid: "111",
      auth_token: "222",
      from: "+333",
      to: "+444",
      body: "Thank you, loyal customer! Your order has been successfully placed.\nEstimated Delivery Time: 12:43"
    }
  end

  it 'sends an SMS to confirm the order along with estimated delivery time' do
    args = {
        from: config[:from],
        to: config[:to],
        body: "Thank you, loyal customer! Your order has been successfully placed.\nEstimated Delivery Time: 2017-03-27 12:43:00 +0100"
      }

    allow(Time).to receive(:now).and_return(Time.parse("11:43"))
    sms.send
    expect(messages).to have_received(:create).with(args)
  end

end
