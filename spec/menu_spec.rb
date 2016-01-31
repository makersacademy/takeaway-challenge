require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#list' do
    it 'lists out the dish_list' do
      expect(menu.list).not_to be_empty
    end
  end

  describe '#price' do
    it 'returns the price of an item from dish_list' do
      value = rand
      allow(menu).to receive(:list).and_return('item' => value)
      expect(menu.price('item')).to eq value
    end

    it 'raises error if item is not in menu' do
      message = 'Item not in menu!'
      allow(menu).to receive(:list).and_return('item')
      expect { menu.price('other_item') }.to raise_error(message)
    end
  end
end
