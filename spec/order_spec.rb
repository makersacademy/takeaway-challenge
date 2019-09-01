require './lib/order'
#require './lib/takeaway'

describe Order do


  describe '#add_items' do
    it 'allows customer to add items from menu to basket' do
      subject.add_items('item', 2)
      expect(subject.basket).to eq({'item' => 2})
    end
  end

  describe '#basket_contents' do
    it 'provids a summary of items added to basket including price' do
      subject.add_items('chips', 2)
      expect{subject.basket_contents}.to output("chips x 2 total: £4\n").to_stdout
    end
  end


end
