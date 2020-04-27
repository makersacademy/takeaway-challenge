require 'sms'
describe SMS do
  subject(:sms) { described_class.new(config, client:nil) }
  let(:client) { double :client, messages: messages }
  let(:messages) {double :messages}
  let(:config) do
    {
      account_sid: "AC347e8287a5af16dd479242066115399d",
      auth_token: "164a10ef8190c5616ffbd3ea0123ac0e",
      from: "+12512921409",
      to: "+447444101910",
      body: "Thank you! Your order will be delivered before %s "
    }
  end
  it 'delivers an sms with the estimated time' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order will be delivered before 18.52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17.52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
  end

end
