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
      item = 'fries'
      expect(menu.price(item)).to eq menu.list[item]
    end

    it 'raises error if item is not in menu' do
      message = 'Item not in menu!'
      expect { menu.price(rand) }.to raise_error(message)
    end
  end
end
