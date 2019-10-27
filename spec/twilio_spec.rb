require 'twilio'

describe Twilio do
  subject(:twilio) { described_class.new(config, client: client) }

  let(:client) {double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do
    {
      account_sid: "AC440a2d99f87bc601c3061a527531410d",
      auth_token: "6110803450b022f8e78ce221ab076a87",
      from: "+13342698973",
      to: "+447447663239",
      body: "Thank you for your order. It will be delivered before %s"
    }
  end

  it 'delivers a message with estimated delivery' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you for your order. It will be delivered before 18:52"
    }

    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    twilio.deliver
    expect(messages).to have_received(:create).with(args)
  end

end
