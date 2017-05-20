require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#add_item' do
    it 'adds a dish with a specific price to the menu' do
      menu.add_item(:bread, 3)
      expect(menu.list).to eq ({bread: 3})
    end
  end

  describe '#list' do
    it 'initially gives an empty list' do
      expect(menu.list).to be_empty
    end
    it 'portrays the list of options, with price' do
      menu.add_item(:bread, 3)
      expect(menu.list).to eq({ bread: 3 })
    end
  end

  describe '#selected_item(dish)' do
    before do
      menu.add_item(:bread, 3)
      menu.add_item(:bean_burger, 8)
    end
    it 'selects the chosen dish from the menu list' do
      menu.selected_item(:bean_burger)
      expect(menu.dish).to eq "bean burger"
      expect(menu.price).to eq 8
    end
    it 'raises an error if the selected item is not on the list' do
      expect { menu.selected_item(:childrens_tears) }.to raise_error 'Sorry, that item is not available!'
    end
  end
end
