require 'order'
require 'menu'

describe Order do

  context 'when added' do

    it 'should add items added from menu to the order' do
      menu = Menu.new
      item = menu.add(1)
      expect(subject.add(item)).to eq [item]
    end

  end

  context 'when deleted' do

    it 'should delete items added from menu to the order' do
      expect(subject.delete(1)).to eq []
    end

  end

end
