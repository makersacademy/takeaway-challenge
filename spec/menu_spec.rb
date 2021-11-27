require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  
  describe '#initialisation' do
    it 'it holds information on dishes and prices upon initialisation' do
      expect(menu.dishes).to include('hamburger' => 8, 'fries' => 5, 'milkshake' => 5)
    end
  end
end
