require 'confirmation'

describe Confirmation do
  subject(:confirmation) { described_class.new(config, client: client) }
  
  let(:client) { double(:client, messages: messages) }
  let(:messages) { double :messages }
  let(:config) do {
    account_sid: "ACe7228d03fcd543a19ef777f771d5be69",
    auth_token: "c16c4328034559156434ebde11fefbb0",
    body: "Thank you! Your order was placed and will be delivered before %s",
    to: "+447585112293",
    from: "+441913280595"
  }
  end

  
  it 'sends a confirmation text' do
    confirmation_text = {
    body: "Thank you! Your order was placed and will be delivered before 18:52",
    to: config[:to],
    from: config[:from]
    }
    allow(Time).to receive(:now).and_return(Time.parse('17:52'))
    expect(messages).to receive(:create).with(confirmation_text)
    confirmation.deliver
  end
  
  
end