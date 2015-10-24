require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'contains a menu' do
      expect(takeaway.menu).not_to be_nil
    end
  end



end
