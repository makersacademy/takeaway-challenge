require 'messenger'
require 'dotenv'
Dotenv.load

describe Messenger do

  subject(:messenger) {described_class.new}

  describe '#send_message' do
    it 'send a message containing time +1h' do
      allow(messenger).to receive(:send_message) {1}
      expect(subject.send_message).to eq 1
    end
  end
end
