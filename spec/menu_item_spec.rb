require 'menu_item.rb'

describe MenuItem do

  describe '#to_s' do
    it 'returns menu item as a string' do
      menu_item = MenuItem.new("Malt Loaf Rarebit", 10, "starter")
      expect(menu_item.to_s).to eq("Malt Loaf Rarebit: £10")
    end
  end

end
