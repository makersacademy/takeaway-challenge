require 'messenger'

describe Messenger do
  subject(:messenger) { described_class.new }

  describe '#send_message' do
    it 'can send a message' do
      allow(messenger).to receive(:send_message).and_return("Success")
      message = "Your Dominos pizza is on its way!"
      expect(messenger.send_message(message)).to eq "Success"
    end
  end
end
