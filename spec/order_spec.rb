require './lib/order'
require './lib/menu'

describe Order do

  describe '#show_menu' do

    it 'shows a list of the menu' do
      expect(subject.list_menu).to eq (subject.menu)
    end

  end


end
