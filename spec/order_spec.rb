require 'order'

describe Order do

  let(:menu_item) {double :menu_item}

  describe '#initialize' do
    it 'returns a empty array' do
      expect(subject.ordered_items).to be_empty
    end
  end

  describe '#save_order_items' do
    it 'saves an item to a list' do
      subject.save_order_items(menu_item)
      expect(subject.ordered_items.count).to eq(1)
    end
  end
end
