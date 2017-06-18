require 'messenger'

describe Messenger do
  let(:messenger) { described_class.new }

  describe '#initialize' do
    it 'is initialized with a client' do
      expect(messenger.client).to_not be_nil
    end

    it 'is initialized with a "from" number' do
      expect(messenger.from).to_not be_nil
    end
  end
end
