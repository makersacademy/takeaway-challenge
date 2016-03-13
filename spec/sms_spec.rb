require 'sms'
Dotenv.load

describe Sms do
  subject(:sms) { described_class.new }
  let(:client) { double :client }
  text = "Order total: £14. Tobenna is preparing your order."\
   ' Estimated delivery: 20:45.'

  it 'can send text' do
    twilio_body = { from: ENV['FROM'], to: ENV['MY_NUM'], body: text }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['SID'],
                                                       ENV['TOKEN']
                                                      ).and_return(client)
    subject.send(text)
  end

  it 'composes message' do
    allow(sms).to receive(:name).and_return('Tobenna')
    allow(sms).to receive(:calculate_waiting).and_return('20:45')
    expect(sms).to receive(:send).with(text)
    sms.message(14)
  end
end
