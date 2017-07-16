require 'order.rb'

describe Order do
  describe '#add item to order' do
    it 'adds each item ordered to a hash' do
      expect(subject.add_item_to_order("food", 3)).to eq({food: 3})
    end
  end
end
