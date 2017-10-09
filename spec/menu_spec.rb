require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  #
  # describe '#display_header' do
  #   it 'displays the menu header' do
  #     expect { menu.display_header }.to output().to_stdout
  #   end
  # end

  describe '#show' do
    it 'displays menu' do
      expect { menu.show }
        .to output("#{Menu::MENU_HEADER}#{Menu::MENU_ITEM_HEADER}#{Menu::MENU_ITEMS}").to_stdout
    end
  end

end
