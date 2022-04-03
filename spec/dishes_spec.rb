require_relative '../lib/dishes'

describe Dishes do

  context '#Open_menu' do
    it 'Opens menu and returns list of dishes' do
      menu_double = double(:open_menu, open_menu: {1 => "Hamerburger", "Price" => "5"})
      expect(menu_double.open_menu).to eq( {1 => "Hamerburger", "Price" => "5"} )
    end
  end

end