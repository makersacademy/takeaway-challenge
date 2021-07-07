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

    it 'adds an item with a quantity' do
      new_item = subject.add_item("margherita", 5)
      expect(subject.show_order).to eq new_item
    end
  end
 
  describe '#total' do
    it 'returns total number of items' do
      subject.add_item("margherita", 5)
      expect(subject.total).to eq "Total items: 5"
    end

    it 'returns total number of items of multiple pizzas' do
      subject.add_item("margherita", 5)
      subject.add_item("vegetarian", 3)
      expect(subject.total).to eq "Total items: 8"
    end
  end
end
