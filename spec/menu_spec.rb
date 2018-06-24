require_relative '../lib/menu.rb'

describe Menu do

  it 'instantiates with a user-defined title' do
    expect(Menu.new('English Menu').title).to eq 'English Menu'
  end

  describe '@items' do
    let(:menu) { double("Menu", :items => { 'Fish and Chips' => 3.20 }) }
    it 'stores item names as keys within a hash' do
      expect(menu.items).to have_key('Fish and Chips')
    end
    it 'stores item prices as values within a hash' do
      expect(menu.items).to have_value(3.20)
    end
  end

  describe '.add_item' do
    menu = Menu.new
    it 'adds menu items to the items hash' do
      menu.add_item('Glass of Beer', 2.75)
      expect(menu.items).to have_key('Glass of Beer')
    end
  end

  describe '.list_items' do
    it 'raises an error if no items have been added to the menu' do
      expect { Menu.new.list_items }.to \
        raise_error('Please add an item to the menu first!')
    end
    # Is this the correct way to test print output? Seems unlikely, but I can't test the methods individually as they are private.
    it 'displays a list of menu items to the user' do
      menu = Menu.new
      menu.add_item('Roast Beef', 3.50)
      expect { menu.list_items }.to \
      output("------------------------------\nRestaurant Menu\n------------------------------\n1. Roast Beef - £3.50\n").to_stdout
    end
  end
end
