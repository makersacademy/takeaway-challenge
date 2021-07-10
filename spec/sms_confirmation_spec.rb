require 'sms_confirmation'
require 'dotenv/load'

describe Text do
  let(:messages) {double(create: 'sent')}
  describe 'responds to required methods' do
    it { is_expected.to respond_to(:send) }
    it { is_expected.to respond_to(:generate_message) }
    it { is_expected.to respond_to(:time) }
  end

  describe '#generate_message' do
    let(:client) { double(messages: foo)}
    let(:subject) { described_class.new(client)}
    let(:foo) {double(create: 'bar')}
    xit 'does a thing' do
      allow(subject).to receive(:generate_message) { foo }
      expect(subject.send).to have_received(:create).with('bar')
    end
  end
end