require 'sms'
describe SMS do 

  subject(:sms) { described_class.new(config, client: client) }
  let(:messages) { spy(:messages) } 
  let(:client) { double(:client, messages: messages) }

  # before do 
  #   allow(client).to receive(:messages)

  # end 

  let(:config) do 
    { account_sid: "123",
    auth_token: "123",
    from: "+123",
    to: "+123",
    body: "Thank you! Your order is being delivered"
  }
  end 

  it 'delivers an sms' do
    args = { from: config[:from],
    to: config[:to],
    body: "Thank you! Your order is being delivered"
    }
    p sms
    # expect(messages).to receive(:create).with(args)
    sms.deliver
  end

end
