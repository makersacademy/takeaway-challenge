require'sms_text'

describe SMSText do

  # let(:send_sms) { double :send_sms }
  let(:client) { double :client }
  subject { described_class.new(client) }

  it "responds to test" do
    expect(subject).to respond_to(:send_sms)
  end

  it 'calls messages on twilio client' do
    allow(client).to receive(:create)
    expect(client).to receive(:messages).and_return(client)
    subject.send_sms
  end

  it 'calls create on twilio' do
    allow(client).to receive(:messages).and_return(client)
    expect(client).to receive(:create)
    subject.send_sms
  end

end