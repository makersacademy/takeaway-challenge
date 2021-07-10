require 'sms_confirmation'
require 'dotenv/load'
require 'timecop'

describe Text do
  let(:messages) {double(create: 'sent')}
  describe 'responds to required methods' do
    it { is_expected.to respond_to(:send) }
    it { is_expected.to respond_to(:generate_message) }
    it { is_expected.to respond_to(:time) }
  end

  describe '#generate_message' do
    let(:client) { double(messages: 'foo')}
    let(:subject) { described_class.new(client)}
    let(:messages) { double(:messages)}
    
    xit 'does a thing' do
      allow(subject).to receive(:generate_message) { foo }
      expect(subject.messages).to have_received(:create).with('foo')
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