require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  describe '#initialize' do
    it 'there is a menu with items' do
      expect(menu.items).not_to be_empty
    end
  end

  describe '#add_item' do
    it 'can add an item with a price to the menu' do
      menu.add_item("Ukha", 9)
      expect(menu.items).to include("Ukha" => 9)
    end
  end

  describe '#delete_item' do
    it 'can delete an item from the menu' do
      menu.delete_item("Shuba")
      expect(menu.items).not_to include("Shuba")
    end
  end

  describe "#print_menu" do
    it 'can print the menu to stdout' do
      expect { menu.print_menu }.to output.to_stdout
    end
    
  end
  
end
