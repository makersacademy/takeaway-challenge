require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#add_items(item,price)' do
    it 'allows user to add items to items hash' do
      subject.add_items("Chips", 3)
      expect(subject.items).to eq({ "Chips" => 3 })
    end
    it 'adds to existing list of dishes' do
      subject.add_items("Chips", 3)
      subject.add_items("Fish", 5)
      expect(subject.items).to eq({ "Chips" => 3, "Fish" => 5 })
    end
  end

  describe '#add_items_from_hash(hash)' do
    it 'stores items within menu list from existing hash' do
      menu.add_items_from_hash(Menu::CHINESE_MENU_ITEMS)
      expect(menu.items).to eq Menu::CHINESE_MENU_ITEMS
    end
  end

  describe '#items' do
    it 'returns list of dishes' do
      menu.add_items_from_hash(Menu::INDIAN_MENU_ITEMS)
      expect(menu.items).to eq Menu::INDIAN_MENU_ITEMS
    end
  end
  describe '#print_menu' do
    it 'prints menu to STDout as string' do
      menu.add_items("Prawn Toast", 3.0)
      expect { menu. print_menu }.to output("Prawn Toast, price £3.00\n").to_stdout
    end
    it 'raises error if no items added to menu' do
      expect { menu.print_menu }.to raise_error "No items added to menu"
    end
  end
  describe "#available?(item)" do
    it 'confirms if an item is not available from stored menu items' do
      expect(menu.item_available?("Pizza")).to eq false
    end
    it 'confirms if item is available from stored menu items' do
      menu.add_items("Pizza", 5)
      expect(menu.item_available?("Pizza")).to eq true
    end
  end
end
