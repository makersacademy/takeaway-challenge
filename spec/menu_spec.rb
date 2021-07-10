require 'menu'

describe Menu do
  describe '#initialize' do
    it 'initializes with the menu' do
      expect(subject.menu).to include('Margherita Pizza' => 8)
    end
  end
  describe '#print_menu' do
    it 'prints the menu' do
      test_menu = Menu.new({ 'Bruschetta' => 5, 'Garlic Bread' => 4 })
      expect { test_menu.print_menu }.to output("Menu:\nBruschetta: £5\nGarlic Bread: £4\n").to_stdout
    end
  end
end