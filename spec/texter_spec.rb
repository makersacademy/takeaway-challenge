require 'texter'

describe Texter do
  subject { described_class.new }

  describe '#send' do
    it 'text message can be sent' do
      expect(subject).to respond_to(:send)
    end
  end
end
