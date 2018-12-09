require 'menu_display'

describe Menu_Display do

  let(:menu_display) { Menu_Display.new }
  #let(:menu) { double :menu, loaded_menu:  }

  describe '#show' do

    it 'subject responds to show' do
      expect(menu_display).to respond_to(:show)
    end

    it 'adds items to list' do
      menu_display.show
      expect(menu_display.list).not_to be_empty
    end

    # THIS TEST NEEDS WORK, CAN'T FATHOM HOW TO DO IT

    # it 'shows a formatted list of menu items with index' do
    # allow(menu_display).to receive(:menu).and_return(    )
    #   menushow.show
    #   expect(menu_display.show).to include(menu)
    # end
  end
end
