require 'messenger'

describe Messenger do
  describe '#initialize' do
    it 'sent is false' do
      expect(subject.sent).to eq false
    end

    it 'log is empty' do
      expect(subject.log).to be_empty
    end
  end

  describe '#send_sms' do
    context 'when number is invalid' do
      it 'sent is false' do
        subject.send_sms('12345', 'text invalid number')
        expect(subject.sent).to eq false
      end
    end

    context 'when number is valid' do
      it 'sent is true' do
        subject.send_sms(ENV['USER_MOBILE'], 'text valid number')
        expect(subject.sent).to eq true
      end
    end
  end
end