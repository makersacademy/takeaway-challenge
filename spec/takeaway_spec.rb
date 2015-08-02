require 'takeaway'

describe Takeaway do 

  describe '#menu' do   
    it 'contains food' do
      expect(subject.menu).not_to be_empty
    end    
  end
  
  describe '#to_cook' do
   it { expect(subject.to_cook).to be_empty }
  end
  
  it { expect(subject).to respond_to(:whats_cooking) }
end