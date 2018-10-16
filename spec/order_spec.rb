require 'order'

describe Order do
  
  describe '#order' do
    it 'responds to order' do
      expect(subject).to respond_to(:order).with(1).arguement
    end
    
    it 'it outputs order list' do
        expect(subject.order([1,2,3])).to chan
    end
  end
end
