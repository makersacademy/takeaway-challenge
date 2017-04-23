require 'text_notifier.rb'

describe TextNotifier do
  subject { described_class.new}

  describe '#send_sms' do
    let(:number) { 123 }
    let(:body) { "test sms" }

    it 'sends a text to a recipient' do
      expect(subject).to receive(:text).with(number, body)
      subject.send_sms(number, body)
    end
  end
end
