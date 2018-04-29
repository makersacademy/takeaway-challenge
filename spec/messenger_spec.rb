require 'messenger'

describe Messenger do
  describe '#message' do
    it 'responds to a message method' do
      expect(subject).to respond_to(:message)
    end
  end
end
