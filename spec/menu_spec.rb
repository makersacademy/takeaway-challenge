require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#display_header' do
    it 'displays the menu header' do
      expect { menu.display_header }.to output(Menu::MENU_HEADER).to_stdout
    end
  end

  describe '#display_items' do
    it 'displays menu items' do
      expect { menu.display_items }
        .to output("#{Menu::MENU_ITEM_HEADER}\n#{Menu::MENU_ITEMS}\n").to_stdout
    end
  end

end
