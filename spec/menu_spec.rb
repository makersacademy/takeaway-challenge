require 'menu'

describe Menu do
  let(:item) { double :item, name: "Ukha", price: 9 }
  let(:item_class) { double :item_class, new: item }
  subject(:menu) { Menu.new(item_class) }

  describe '#initialize' do
    it 'there is an empty menu' do
      expect(menu.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'can add an item with a price to the menu' do
      menu.add_item("Ukha", 9)
      expect(menu.items).to include("Ukha" => 9)
    end

    it 'can create an item' do
      expect(item_class).to receive(:new)
      menu.add_item("Ukha", 9)
    end
  end

  describe '#delete_item' do
    it 'can delete an item from the menu' do
      menu.add_item("Ukha", 9)
      menu.delete_item("Ukha")
      expect(menu.items).not_to include("Ukha", 9)
    end
  end

  describe "#print_menu" do
    it 'can print the menu to stdout' do
      menu.add_item("Ukha", 9)
      expect { menu.print_menu }.to output.to_stdout
    end
  end
end
