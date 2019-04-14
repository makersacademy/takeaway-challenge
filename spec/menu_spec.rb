require 'menu'

describe Menu do
  describe '#print_menu' do
    it 'prints the menu' do
      dishes = { pizza: 5, pasta: 7 }
      printed_menu = "pizza ... £5\npasta ... £7\n"
      menu = Menu.new(dishes)
      expect(menu.print_menu).to eq printed_menu
    end
  end
end
