require 'takeout'
require 'takeout_menu'

describe Takeout do
  describe '#show_menu' do
    it 'displays the menu' do
      menu = TakeoutMenu.new
      expect(subject.show_menu).to eq menu.menu_list
    end
  end
end
