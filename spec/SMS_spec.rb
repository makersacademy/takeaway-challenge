require './docs/SMS'

describe SMS do

  subject(:sms) { described_class.new }

  before do
    allow(sms).to receive(:sms)
  end

  it 'sends a payment confirmation text message' do
    sms.send_sms(ENV['my number'])
  end

  it 'confirms a message has been sent' do
    expect(subject.sms_confirmation).to eq('Confirmation message has been sent')
  end

  it 'changes sent? to true after a message is sent' do
    expect { subject.send_sms(ENV['my number']) }.to change(subject, :sent?).to true
  end

  describe '#send_sms' do
    it "takes a phone number as an argument" do
      expect(subject).to respond_to(:send_sms).with(1).argument
    end
  end
end
