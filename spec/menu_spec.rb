require 'menu'

describe Menu do

  it { is_expected.to respond_to :read_menu }

  describe '#menu' do
    it 'reads the user the menu items and prices.' do
      expect(subject.menu).to eq Menu::MENU
    end
  end

end
