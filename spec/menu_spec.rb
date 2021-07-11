require 'menu'

describe Menu do
  let(:subject) { Menu.new(nil) }
  describe '#initialize' do
    it 'initializes with the menu' do
      expect(subject.menu).to include('Margherita Pizza' => 8)
    end
  end

  describe '#load_menu' do
    it 'loads the pre-existing menu if @menu is nil' do
      expect(subject.menu).to eq Menu::MENU
    end
  end

  describe '#print_menu' do
    it 'prints the menu' do
      test_menu = Menu.new({ 'Bruschetta' => 5, 'Garlic Bread' => 4 })
      expect { test_menu.display }.to output("Menu:\nBruschetta: £5\nGarlic Bread: £4\n").to_stdout
    end
  end
end