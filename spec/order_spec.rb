require 'order'

describe Order do
  
  describe '#initialaise' do
    it 'should initialize and create a an array to store order items' do
      expect(subject.order).to eq []
    end
  end
  
  describe '#add' do
    it 'should add an item to the order' do
      expect { subject.add('food1', 2, 2) }.to change { subject.order.count }.by 1
    end
  end
  
  describe '@order' do
    it 'should return the full order' do
      subject.add('food1', 2, 2)
      expect(subject.order.to_s).to eq '[{:item=>"food1", :qty=>2, :price=>2}]'
    end
  end
  
  describe '#total' do
    it 'should return the total price' do
      subject.add('food1', 2, 2)
      expect(subject.total).to eq 4
    end
  end
  
end
