require 'send_sms'

describe SendSms do

  let(:client) { double :client }
  subject { described_class.new(client) }

  it 'allows users to send a message' do
    expect(subject).to respond_to(:send).with(1).argument
  end

  it 'calls messages on the twilio client' do
    allow(client).to receive(:create)
    expect(client).to receive(:messages).and_return(client)
    subject.send("hello")
  end

  it 'calls create on twilio' do
    allow(client).to receive(:messages).and_return(client)
    expect(client).to receive(:create)
    subject.send("hello")
  end

end



# test you are passing in data that you are expecting to pass in
# check you calling messages and create
#
