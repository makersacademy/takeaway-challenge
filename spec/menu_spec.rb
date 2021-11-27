require 'menu'

describe Menu do
  let(:menu) { Menu.new('Five Girls') }
  
  describe '#initialisation' do
    it 'holds information on dishes and prices' do
      expect(menu.dishes).to include('hamburger' => 8.00, 'fries' => 5.00, 'milkshake' => 5.00)
    end

    it 'assigns the menu selected by the user to the dishes instances variable - Grandos' do
      alternative_menu = Menu.new('Grandos')

      expect(alternative_menu.dishes).to include('quarter chicken' => 4.00, 'corn on the cob' => 2.50, 'grilled halloumi' => 2.50)
    end

    it 'assigns the menu selected by the user to the dishes instances variable - LEONA' do
      alternative_menu = Menu.new('LEONA')

      expect(alternative_menu.dishes).to include('halloumi wrap' => 6.50, 'black bean box' => 6.50, 'matcha latte' => 3.00)
    end
  end
end
