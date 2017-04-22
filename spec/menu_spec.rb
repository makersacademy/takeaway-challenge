require 'menu'

describe Menu do

  menu = Menu::MENU

  it { is_expected.to respond_to :read_menu }

  describe '#menu' do
    it 'checks a menu is available.' do
      expect(subject.menu).to eq menu
    end

    it 'reads the menu to the user.' do
      expect(subject.read_menu).to eq menu
    end
  end

end
