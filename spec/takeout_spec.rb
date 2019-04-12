require 'takeout'
require 'takeout_menu'

describe Takeout do
  describe '#show_menu' do
    it 'displays the menu' do
      menu = TakeoutMenu.new
      expect(subject.show_menu).to eq menu.menu_list
    end
  end
  describe '#select' do
    it 'returns error if selected food is not on the menu' do
      expect { subject.select("foobar") }.to raise_error "That item is not on the menu!"
    end
  end
end
