require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }
  let(:menu_header) { double(:menu_header) }
  let(:menu_items) { double(:menu_items) }
  let(:menu_footer) { double(:menu_footer) }

  describe '#display' do
    it 'displays the menu' do
      menu_output = "#{menu_header}\n\n#{menu_items}\n\n#{menu_footer}\n"
      expect { menu.display_menu(menu_header, menu_items, menu_footer) }
        .to output(menu_output).to_stdout
    end
  end

end
