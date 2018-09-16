require './lib/order'
require './lib/menu'

describe Order do

  describe '#show_menu' do

    it 'shows a list of the menu' do
      expect(subject.list_menu).to eq (subject.menu)
    end

  describe '#choose items' do

    it 'adds an item to the order' do
      item = :egg_fried_rice
      subject.choose_item(item)
      expect(subject.order).to eq [item]
    end

  end

  end


end
