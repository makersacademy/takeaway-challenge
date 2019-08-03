require_relative '../lib/sms.rb'

describe SMS do
  let(:messages) {spy(:messages)}
  let(:client) {double(:client, messages: messages)}
  let(:config) do
     {account_sid: "123",
     auth_token: "234daa",
     from: "+543",
     to: "+576",
     body: "Thank you! Your order will be delivered before %s"}
    end
  subject(:sms) {described_class.new(config, client: client)}

  describe '#deliver' do
    it 'sends an SMS with estimated delivery time' do
      message_info = {
        from: config[:from],
        to: config[:to],
        body: "Thank you! Your order will be delivered before 18:52"
      }
      allow(Time).to receive(:now).and_return(Time.parse("17:52"))
      sms.deliver
      expect(messages).to have_received(:create).with(message_info)

    end
  end

end