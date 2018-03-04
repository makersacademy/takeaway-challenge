require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe 'initialize' do
    it 'has a menu ready' do
      expect(takeaway.menu).to not_be empty
    end
  end
end
