require 'menu'

describe Menu do

  let(:menu_items) { { "Cheese Burger" => 9.00, "French Fries" => 3.50 } }
  let(:menu) { described_class.new(menu_items) }

  describe '#initialize' do
    it 'is initialized with menu items' do
      expect(menu.menu_items).not_to be_empty
    end
    it 'has a list of menu items' do
      expect(menu.menu_items).to eq menu_items
    end
  end

  describe '#show_menu' do
    it 'responds to show menu' do
      expect(menu).to respond_to(:show_menu)
    end
    it 'formats the menu correctly' do
      expected_output = "Cheese Burger:    £9.00\nFrench Fries:    £3.50\n"

      expect { menu.show_menu }.to output(expected_output).to_stdout
    end
  end

  describe '#has_item?' do
    it 'true if an item is on the menu' do
      expect(menu.has_item?("Cheese Burger")).to be true 
    end
    it 'false if an item is not on the menu' do
      expect(menu.item?("Chicken Burger")).to be false 
    end
  end

  describe '#price' do
    it 'returns the items price' do
      expect(menu.price("Cheese Burger")).to eq menu_items["Cheese Burger"]
    end
    it 'raises an error if the item is not on the menu' do
      expect { menu.price("Chicken Burger") }.to raise_error("Item not on the menu")
    end
  end

end
