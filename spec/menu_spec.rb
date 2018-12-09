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

  describe '#show' do

    it 'subject responds to show' do
      expect(menu).to respond_to(:show)
    end

    it 'adds items to list' do
      menu.show
      expect(menu.list).not_to be_empty
    end
  end

    # THIS TEST NEEDS WORK, CAN'T FATHOM HOW TO DO IT

    # it 'shows a formatted list of menu items with index' do
    # allow(menu).to receive(:menu).and_return(    )
    #   menushow.show
    #   expect(menu.show).to include(menu)
    # end
end
