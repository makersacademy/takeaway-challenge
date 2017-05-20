require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#list' do
    it 'portrays the list of options, with price' do
      expect(menu.list).to eq({ bean_burger: 8, vegan_cheese_platter: 6, jack_fruit_burger: 8, breaded_aubergine: 7 })
    end
  end

  describe '#selected_item(dish)' do
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
