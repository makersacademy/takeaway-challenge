require 'sms'
describe SMS do
  subject(:sms) { described_class.new(config, client:nil) }
  let(:client) { double :client, messages: messages }
  let(:messages) {double :messages}
  let(:config) do
    {
      account_sid: "123",
      auth_token: "123",
      from: "123",
      to: "123",
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
