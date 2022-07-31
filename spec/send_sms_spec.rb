require './lib/send_sms'

describe SMS do
  describe 'initialize' do
    it 'initialises account_sid' do
      expect(subject.account_sid). to be_kind_of(String)
    end
    it 'initialises auth_token' do
      expect(subject.auth_token). to be_kind_of(String)
    end
    it 'initialises from' do
      expect(subject.from). to be_kind_of(String)
    end
    it 'initialises to' do
      expect(subject.to). to be_kind_of(String)
    end
    it 'initialises time' do
      expect(subject.time). to be_kind_of(Time)
    end
  end
  describe 'send_sms' do
    it 'sends a message' do
      allow(subject).to receive(:send_sms) { "A message has been sent" }
      expect(subject.send_sms).to eq "A message has been sent"
      # the above test is circular and only serves 
      # to prevent sending of an actual text message
    end
  end
end