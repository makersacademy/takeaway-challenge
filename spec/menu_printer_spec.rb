require './lib/menu_printer'
describe MenuPrinter do
  subject(:printer) { described_class.new }
  describe '#display_menu' do
    it 'displays the menu in a readable way' do
      expect { printer.display_menu({ tortilla: 4, gazpacho: 3 }) }.to output("\"Dish: tortilla, price: £4\"\n\"Dish: gazpacho, price: £3\"\n").to_stdout
    end
  end
end
