require 'sms_confirmation'
require 'timecop'

describe Text do
  let(:messages) {double(create: 'sent')}
  describe 'responds to required methods' do
    it { is_expected.to respond_to(:send) }
    it { is_expected.to respond_to(:generate_message) }
    it { is_expected.to respond_to(:time) }
  end

  describe '#generate_message' do
    let(:client) { double(:client, messages: messages)}
    let(:subject) { described_class.new(client)}

    it 'is passed correctly to send' do
      allow(subject).to receive(:generate_message) { 'foo' }
      subject.send
      expect(messages).to have_received(:create).with('foo')
      expect(subject.generate_message).to eq('foo')
    end

    it 'correctly pulls env vars' do
      ENV['SENDING_NUM'] = '+1234567890'
      ENV['RECEIVING_NUM'] = '+0987654321'
      expect(subject.generate_message).to include(from:"+1234567890")
    end
  end

  describe '#time' do
      it 'returns an hour later' do
        Timecop.freeze(2012, 10, 5, 12) do
          expect(subject.time).to eq('13:00')
        end
    end
  end
end