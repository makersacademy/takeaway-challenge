require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  describe '#load_menu' do

    it 'should load menu from csv file into @menu' do
      menu.load_menu
      expect(menu.loaded_menu).not_to be_empty
    end

    it 'should load a default menu of dishes with prices and descriptions' do
      expect(menu).to have_attributes(:loaded_menu => menu.loaded_menu)
    end
  end
end
