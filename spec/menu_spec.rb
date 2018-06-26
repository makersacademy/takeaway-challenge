require_relative '../lib/menu.rb'

describe Menu do

  it 'instantiates with a user-defined title' do
    expect(Menu.new('English Menu').title).to eq 'English Menu'
  end

  describe '@items' do
    let(:menu) { double("Menu", :items => { 'Fish and chips' => 3.20 }) }
    it 'stores item names as keys within a hash' do
      expect(menu.items).to have_key('Fish and chips')
    end
    it 'stores item prices as values within a hash' do
      expect(menu.items).to have_value(3.20)
    end
  end

  describe '#add_item' do
    menu = Menu.new
    it 'adds menu items to the items hash' do
      menu.add_item('Glass of beer', 2.75)
      expect(menu.items).to have_key('Glass of beer')
    end
  end

  describe '#list_items' do
    it 'raises an error if no items have been added to the menu' do
      expect { Menu.new.list_items }.to \
        raise_error('Please add an item to the menu first!')
    end

    it 'displays a list of menu items to the user' do
      menu = Menu.new
      menu.add_item('Roast beef', 3.50)
      expect { menu.list_items }.to \
      output("------------------------------\nRestaurant Menu\n------------------------------\n1. Roast beef - £3.50\n").to_stdout
    end
  end
end
