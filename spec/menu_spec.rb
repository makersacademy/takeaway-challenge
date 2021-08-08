require 'menu'

describe Menu do

  let(:pepperoni) { double({ dish: "Pepperoni", price: 12 } )}
  let(:cheese) { double({ dish: "4 Cheeses", price: 11 } )}
  let(:bbq) { double({ dish: "BBQ Meat Feast", price: 13 } )}
  let(:magherita) { double({ dish: "Magherita", price: 10 } )}

  let(:menu_config) do
    [
      { dish: "Pepperoni", price: 12 },
      { dish: "4 Cheeses", price: 11 },
      { dish: "BBQ Meat Feast", price: 13 },
      { dish: "Magherita", price: 10 }
  ]
  end

  subject(:menu) { described_class.new }

  it 'has a menu' do
    menu.add_item(menu_config)
    expect(menu.items).to include(menu_config)
  end

  describe '#add_item' do

    it 'can add individual items to the menu' do
      expect { menu.add_item(pepperoni) }.to change { menu.items.count }.by (1)
    end

  end

  describe '#remove_item' do
  
    it 'can remove individual items from the menu' do
      menu.add_item(pepperoni)
      expect { menu.remove_item(pepperoni) }.to change { menu.items.count }.by (-1)
    end

    it 'is expected to raise error message if item to remove doesn\'t exist' do
      expect { menu.remove_item(pepperoni) }.to raise_error("#{pepperoni} does not exist on the menu")
    end

  end
  
end
