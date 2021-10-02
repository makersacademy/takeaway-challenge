require 'order'

describe Order do

  describe '#initialize' do
    it 'with an empty order' do
      expect(subject.order).to be_empty
    end
    it 'with zero as the total' do
      expect(subject.total).to eq 0
    end
  end

  describe '#add' do
    it 'adds an item to the order' do
      item = 'Item 1'
      expect(subject.add(item)).to include item 
    end
  end
  
end
