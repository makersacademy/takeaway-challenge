require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new([['catnip', 5], ['CATnip', 10], ['CATNIP', 15]]) }

  describe '#show' do
    it 'displays the menu' do
      expect(subject.show).to eq [['catnip', 5], ['CATnip', 10], ['CATNIP', 15]]
    end

    pending 'pulls items from array'
  end

  context 'adding items' do
    it 'displays the list of items' do
      item_array = [['item 1', 5], ['item 2', 10], ['item 3', 15]]
      menu = Menu.new(item_array)
      expect(menu.items).to eq item_array
    end
  end
end
