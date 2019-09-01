require './lib/order'
#require './lib/takeaway'

describe Order do
  

  describe '#add_items' do
    it 'allows customer to add items from menu to basket' do
      subject.add_items('item', 2)
      expect(subject.basket).to eq({'item' => 2})
    end
  end


end
