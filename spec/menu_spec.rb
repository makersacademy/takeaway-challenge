require 'menu'

describe Menu do
  describe '#menu_list' do
    it 'displays the menu' do
      expect(subject.menu_display).to eq subject.menu_mains
    end
  end
end
