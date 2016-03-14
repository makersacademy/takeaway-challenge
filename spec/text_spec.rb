require 'text'

describe Text do
  subject(:text) { described_class.new }
  let(:client) {double :Client, messages: messages}
  let(:messages) {double :message, create: nil}
  let(:message) { 'message' }
  describe '#send_confirmation' do
    it 'sends confirmation text' do
      allow(text).to receive(:send_confirmation)
      expect{ (messages).to receive(:create).with(3).arguments }
      text.send_confirmation(message)
    end
  end
end
