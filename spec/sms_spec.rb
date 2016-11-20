require 'sms'

describe SMS do

  subject(:sms) { described_class.new }
  let(:client) {double :client}

  it 'sends confirmation message' do
    message = "Order complete"
    twilio_info = {from: '+441926801014', to: '+447872900801', body: message}
    allow(client).to receive_message_chain(:account, :messages, :create).with(twilio_info)
    expect(subject).to receive(:send).and_return(client)
    subject.send
  end

end
