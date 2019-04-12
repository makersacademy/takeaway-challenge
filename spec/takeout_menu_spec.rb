require 'takeout_menu'

describe TakeoutMenu do
  describe '#menu_list' do
    it 'displays the menu' do
      expect(subject.menu_list).to eq subject.menu_mains
    end
  end
end
