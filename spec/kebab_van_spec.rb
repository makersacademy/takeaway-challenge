require 'kebab_van'

describe KebabVan do
  context 'Kebab Van menu restaurant menu' do
    it 'has a specific kebab van menu' do
      moeskebab = KebabVan.new 'Moe\'s Kebab'
      expect(moeskebab.menu_list).to eq 'Burger: £2, 
                                               Doner-Kebab: £4, 
                                               Chips-and-Cheese: £3, 
                                               Chicken-Kebab: £5, 
                                               Mixed-Kebab: £4,
                                               Chicken-Burger: £3,'
    end
  end
end