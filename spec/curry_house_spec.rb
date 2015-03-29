require 'curry_house'

describe CurryHouse do
  context 'Curry Houserestaurant menu' do
    it 'has a specific curry house menu' do
      lemongrass = KebabVan.new 'Lemon Grass'
      expect(moeskebab.menu_list).to eq 'Duck-Madras: £9, 
                                        Chicken-Korma: £6, 
                                        Pilau-Rice: £3,
                                        Onion-Bargie: £2, 
                                        Naan: £3'
    end
  end
end