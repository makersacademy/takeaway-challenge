require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new }
  
  describe '#menu' do
    it 'should list dishes' do
      expect(takeaway.menu).not_to be nil
    end

  end

  describe '#orders' do
    
  end

  describe '#total' do
    
  end

end