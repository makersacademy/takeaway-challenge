require '/Users/emilyfitzsimmons/Documents/projects/takeaway-challenge/lib/send_sms.rb'

describe SMS do
  subject(:sms) { SMS.new(config, client: client) }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { double :messages }
  let(:config) do 
    {
      account_sid: '123',
      auth_token: '123st',
      from: '+321',
      to: '+456',
      body: "Thank you! Your order will be delivered by %s"
    }
  end

  it 'sends an SMS with ETA' do
    args = {
    from: config[:from],
    to: config[:to],
    body: "Thank you! Your order will be delivered by 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
  end

end