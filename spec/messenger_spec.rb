require 'messenger'

describe Messenger do
  subject(:messenger) { Messenger.new(client) }

  let(:client) { double :client, messages: messages }
  let(:messages) { double :messages }


  let(:config) do
    {
      account_sid: "789",
      auth_token: "789abc",
      from: "+789",
      to: "+987",
      body: "Your order will be delivered before %s"
    }
  end

  it 'delivers a message with the estimated time' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Your order will be delivered before 18:00"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:00"))
    expect(messages).to receive(:create).with(args)
    messenger.deliver
  end
end
