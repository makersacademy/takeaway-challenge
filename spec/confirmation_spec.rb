require 'confirmation.rb'

describe Confirmation do
  subject(:confirmation) { described_class.new }

  describe '#send' do
    it 'confirmation should respond to send' do
      expect(confirmation).to respond_to(:send)
    end
  end

end
