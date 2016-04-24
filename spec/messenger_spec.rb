require 'messenger'
describe Messenger do
  subject(:messenger) { described_class.new(config, client: client) }

  let(:client) {double :client, messages: messages}
  let(:messages) {double :messages}
  let (:config) do {account_sid: "123", auth_token: "234",
                  from: "+123", to: "+234",
                  body: "Thank you! Your order will be delivered by %s"}
                end

  context 'When the order is delivered' do
    it 'sends a message  with the estimated delivery time' do
      args = {from: config[:from], to: config[:to],
              body: "Thank you! Your order will be delivered by 16:20"}
      allow(Time).to receive(:new).and_return(Time.parse("15:20"))
      expect(messages).to receive(:create).with(args)
      messenger.send
    end
  end
end
