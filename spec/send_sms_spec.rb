require 'send_sms'

describe SendSms do

  let(:client) { double :client }
  subject { described_class.new(client) }

  it 'allows users to send a message' do
    expect(subject).to respond_to(:send)
  end

  it 'calls messages on the twilio client' do
    allow(client).to receive(:create)
    expect(client).to receive(:messages).and_return(client)
    subject.send
  end

  it 'calls create on twilio' do
    allow(client).to receive(:messages).and_return(client)
    expect(client).to receive(:create)
    subject.send
  end

end
