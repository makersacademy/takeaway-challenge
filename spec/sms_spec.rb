require 'sms'

describe SMS do 

  subject(:sms) { described_class.new(config, client: client) }

  let(:messages) { spy(:messages) } 

  let(:client) { double(:client, messages: messages) }

  before do 
  allow(client).to receive(:messages)

  end 

  let(:config) do 
    {account_sid: "AC0e4f86d2e04d29dedad3d533e646aaa3",
    auth_token:"cbe2840a574a2b9a86b53fb7de7a66d4",
    from: "+123",
    to: "+447449287088",
    body: "Thank you! Your order is being delivered"
  }
  end 

  it 'delivers an sms' do
    args = {
    from: config[:from],
    to: config[:to],
    body: "Thank you! Your order is being delivered"
    }
    p sms

    sms.deliver
    # expect(messages).to receive(:create).with(args)
  end



end 