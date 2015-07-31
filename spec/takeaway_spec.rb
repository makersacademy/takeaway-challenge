require 'takeaway'

describe Takeaway do
  
  describe '#menu' do
    it 'contains food' do
      expect(subject.menu).not_to be_empty
    end
  end
  
end
  