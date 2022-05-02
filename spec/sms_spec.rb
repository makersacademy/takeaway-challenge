require 'SMS'
# require 'dotenv/load'

describe SMS do

  subject(:sms) {described_class.new}

  before do
    allow(sms).to receive(:sms)
  end

    it 'sends a payment confirmation text message' do
      expect(sms).to receive(:sms)
      sms.send_sms(ENV['MY_PHONE'])
    end

  describe '#send_sms' do
    it "takes a phone number as an argument" do
      expect(subject).to respond_to(:send_sms).with(1).argument
    end
  end

  xit 'sends a confirmation sms to that phone number' do
  end

  xit 'informs the recipient that their meal is on their way and lets them know it will arrive in an hour' do
  end

  it 'changes the status of sent? to true when a message is sent' do
    expect {subject.send_sms(ENV['MY_PHONE'])}.to change(subject, :sent?).to true
  end

  it 'confirms a message has been sent' do
    expect(subject.sms_sent_confirmation).to eq('A confirmation message has been sent to the number you provided')
  end
end
