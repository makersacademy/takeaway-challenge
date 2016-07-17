require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  context '#display_menu' do
    it 'displays a list of dishes and their prices' do
      expect(menu.display_menu).to include('Chicken fried rice - £3.00')
    end
  end
end
