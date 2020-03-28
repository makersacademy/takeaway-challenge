require 'order'

describe Order do

  describe '#show_order' do
    it 'should return an empty list' do
      expect(subject.show_order).to eq([])
    end
  end

  describe '#add_item' do   
    it 'should add item to order list' do
      new_item = subject.add_item("margherita")
      expect(subject.show_order).to eq new_item
    end

    it 'show add an item with a quantity' do
      new_item = subject.add_item("margherita", 5)
      expect(subject.show_order).to eq new_item
    end
  end
 

end
