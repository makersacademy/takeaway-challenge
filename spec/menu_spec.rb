require 'menu'

describe Menu do
  describe '#display_menu' do

    it 'returns a list of items with prices when requested' do
      expect(subject.display_menu).to eq Menu::DEFAULT_MENU
    end
    
  end
end